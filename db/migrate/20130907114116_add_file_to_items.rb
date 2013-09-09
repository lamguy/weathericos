class AddFileToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :file, :string, :after => :name
  end
  def self.down
    remove_column :items, :file
  end
end
