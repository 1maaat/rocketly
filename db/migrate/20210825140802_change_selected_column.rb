class ChangeSelectedColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :artworks, :selected
    add_column :artworks, :selected, :boolean, default: false
  end
end
