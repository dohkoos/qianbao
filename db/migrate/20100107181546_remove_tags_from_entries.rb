class RemoveTagsFromEntries < ActiveRecord::Migration
  def self.up
    remove_column :entries, :tags
  end

  def self.down
    add_column :entries, :tags, :string
  end
end
