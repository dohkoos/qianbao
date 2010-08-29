# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include WillPaginate::ViewHelpers

  def will_paginate_with_i18n(collection, options = {})
    will_paginate_without_i18n(collection, options.merge(
                          :previous_label => I18n.t(:previous, :default => 'Previous'),
                          :next_label => I18n.t(:next), :default => 'Next'))
    end

  alias_method_chain :will_paginate, :i18n
end
