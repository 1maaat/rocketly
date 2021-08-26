class RemoveActivityFieldColumnFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :activity_field
    remove_column :artworks, :selected
    add_column :artworks, :selected, default: false
  end
end
