class AddEffectiveDateToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :effective_date, :date
  end

  def self.down
    remove_column :entries, :effective_date
  end
end
