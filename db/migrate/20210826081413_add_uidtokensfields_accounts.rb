class AddUidtokensfieldsAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :uid, :string, null: false, default: ''
    add_column :accounts, :provider, :string, null: false, default: 'uid'
    add_column :accounts, :tokens, :json
    add_index :accounts, [:uid, :provider], unique: true
  end
end
