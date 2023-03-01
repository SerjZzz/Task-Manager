class AddPasswordResetToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_reset_token_digest, :string
  end
end
