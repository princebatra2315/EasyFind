class Profile < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :fname, presence: true
  validates :price, presence: true
  validates :room_type, presence: true
  validates :details, presence: true
  validates :allowed, presence: true
  validates :phone, presence: true, length: { minimum: 10, maximum: 10}
  validates :address, presence: true

  def self.search(search)
  where("fname LIKE ? OR address LIKE ? OR details LIKE ?",  "%#{search}%", "%#{search}%", "%#{search}%") 
  end

end
