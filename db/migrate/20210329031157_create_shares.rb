class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|
      t.string :name, null: false
      t.string :log_name, null: false, unique: true
      
      


      t.timestamps
    end
  end
end
