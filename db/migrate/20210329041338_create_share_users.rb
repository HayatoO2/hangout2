class CreateShareUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :share_users do |t|

      t.references :user, foreign_key: true
      t.references :share, foreign_key: true
      t.timestamps
    end
  end
end
