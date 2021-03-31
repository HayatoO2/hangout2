class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|

      t.references :user, null: false, foreign_key: true
      t.references :share, null: false, foreign_key: true
      t.text :comment, null: false
      t.datetime :start, null: false
      t.datetime :finish, null: false
      t.boolean :owner_flag, null: false

      t.timestamps
    end
  end
end
