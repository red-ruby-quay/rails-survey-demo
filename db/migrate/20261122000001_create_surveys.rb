class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end

    add_index :surveys, :title
  end
end
