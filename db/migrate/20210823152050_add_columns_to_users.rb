class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :description, :text
    add_column :users, :website_url, :string
    add_column :users, :facebook_url, :string
    add_column :users, :twitter_url, :string
    add_column :users, :instagram_url, :string
    add_column :users, :spotify_url, :string
    add_column :users, :youtube_url, :string
    add_column :users, :dribbble_url, :string
    add_column :users, :artstation_url, :string
    add_column :users, :behance_url, :string
    add_column :users, :country, :string
    add_column :users, :activity_field, :string
  end
end
