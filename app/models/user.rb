class User < ApplicationRecord
	has_many :groups, through:users_groups
	has_many :users_groups
	belongs_to :group
end
