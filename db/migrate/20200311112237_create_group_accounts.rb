class CreateGroupAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :group_accounts do |t|
      t.references :group, foreign_key: true
      t.references :account, foreign_key: true
      t.timestamps
    end
  end
end
