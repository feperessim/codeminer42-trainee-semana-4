class Phone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: { scope: :contact_id }
  validates :kind, inclusion: %w[home work other]
  validates :main, inclusion: [true, false]
  validates :main, uniqueness: {
    scope: :contact_id,
    message: 'A contact can have only a phone defined as main',
    conditions: -> { where(main: true) }
  }
end
