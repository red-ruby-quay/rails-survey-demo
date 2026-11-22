class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.references :survey, null: false, foreign_key: true
      t.string :respondent_name, null: false
      t.integer :score, null: false
      t.text :comment

      t.timestamps
    end
  end
end
