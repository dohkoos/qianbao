class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])

    success = @user && @user.save

    if success && @user.errors.empty?
      #redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end

  def forgot_password
    return unless request.post?
    if @user = User.find_by_email(params[:user][:email])
      @user.forgot_password
      @user.save
      flash[:notice] = "A password reset link has been sent to your email address"
      redirect_back_or_default('/')
    else
      flash[:alert] = "Could not find a user with that email address"
    end
  end

  def reset_password
    @user = User.find_by_password_reset_code(params[:reset_code])
    return if @user unless params[:user]

    new_password = params[:user][:password]
    new_password_confirmation = params[:user][:password_confirmation]

    if (new_password && new_password_confirmation &&
        !new_password.blank? && !new_password_confirmation.blank?)
      @user.reset_password(new_password, new_password_confirmation)
      if @user.save
        flash[:notice] = "Password reset success."
        redirect_back_or_default('/')
      else
        flash[:error] = "Password reset failed."
      end
    else
      flash[:error] = "Password mismatch"
    end
  end
end
