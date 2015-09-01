class User < ActiveRecord::Base
  validates :device_token, presence: true

  has_many :attendances
  has_many :events, through: :attendances
end
