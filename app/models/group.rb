class Group < ApplicationRecord
  # has_many :users, through:users_groups#もともと
  # has_many :users_groups
  # has_many :messages

  has_many :group_accounts
  has_many :accounts, through: :group_accounts
  validates :name, presence: true, uniqueness: true
end

