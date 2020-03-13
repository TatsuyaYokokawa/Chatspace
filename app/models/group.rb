class Group < ApplicationRecord
  # has_many :users, through:users_groups#もともと
  # has_many :users_groups
  # has_many :messages

  has_many :group_accounts
  has_many :accounts, through: :group_accounts
  has_many :messagexxes
  validates :name, presence: true, uniqueness: true

  def show_last_message
    if (last_messagexx = messagexxes.last).present?
      if last_messagexx.content?
        last_messagexx.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end

end

