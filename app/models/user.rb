class User < ApplicationRecord
  has_many :contacts
  validates :name, presence: true, uniqueness: true
  validates :age, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
end
