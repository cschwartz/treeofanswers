class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      t.text :description
      t.references :user

      t.integer :parent_id, null: true

      t.string :type

      t.timestamps
    end
  end
end
