class Profile < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :price, presence: true
  validates :room_type, presence: true
  validates :details, presence: true
  validates :allowed, presence: true
  validates :phone, presence: true, length: { minimum: 10, maximum: 10}
  validates :address, presence: true
end
