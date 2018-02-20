class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

    has_one :profile, dependent: :destroy
    after_create :create_profile
def send_devise_notification(notification, *args)
  devise_mailer.send(notification, self, *args).deliver_later
end

end
