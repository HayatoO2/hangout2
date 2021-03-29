class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.date :date, null: false
      t.references :share, foreign_key: true
      t.timestamps
    end
  end
end
