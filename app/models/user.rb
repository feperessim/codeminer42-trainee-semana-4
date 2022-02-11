class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :age, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
end
