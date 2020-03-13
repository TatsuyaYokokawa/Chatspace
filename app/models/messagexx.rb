class Messagexx < ApplicationRecord
  belongs_to :group
  belongs_to :account
  
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
