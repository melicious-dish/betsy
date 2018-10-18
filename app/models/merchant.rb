class Merchant < ApplicationRecord
  has_many :products

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # TODO: maybe check for valid email form xxx@xxx.xxx
end
