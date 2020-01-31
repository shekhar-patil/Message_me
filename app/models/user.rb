class User < ApplicationRecord
  validates :username, presence: true, length: { minmum: 3, maximum: 15 }
  has_many :messages
  has_secure_password
end
