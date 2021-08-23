class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.string :reward
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
