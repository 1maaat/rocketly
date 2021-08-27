class RemoveActivityFieldColumnFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :activity_field
  end
end
