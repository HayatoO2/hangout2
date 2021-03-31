class CreatePresents < ActiveRecord::Migration[6.0]
  def change
    create_table :presents do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :enter_time, null: false
      t.datetime :leave_time, null: false
      t.references :share, null: false, foreign_key: true
      t.timestamps
    end
  end
end
