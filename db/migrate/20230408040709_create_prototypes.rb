class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :catch_copy, null: false
      t.text :concept, null: false
      t.integer :gender_id, null: false
      t.integer :age_id, null: false
      t.integer :occupation_id, null: false

      
      t.timestamps
    end
  end
end
