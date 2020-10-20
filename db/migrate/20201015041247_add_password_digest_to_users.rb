class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change, :force => true
    add_column :users, :password_digest, :string
  end
end
