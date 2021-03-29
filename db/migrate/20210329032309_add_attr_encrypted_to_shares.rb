class AddAttrEncryptedToShares < ActiveRecord::Migration[6.0]
  def change
    add_column :shares, :encrypted_password, :string
    add_column :shares, :encrypted_password_iv, :string
    add_column :shares, :encrypted_password_confirmation, :string
    add_column :shares, :encrypted_password_confirmation_iv, :string
  end
end