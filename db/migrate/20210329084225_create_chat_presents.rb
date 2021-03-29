class CreateChatPresents < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_presents do |t|
      t.references :present, null: false, foreign_key:true
      t.references :chat, null: false, foreign_key:true
      t.timestamps
    end
  end
end
