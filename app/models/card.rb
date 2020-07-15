class Card < ApplicationRecord
  belongs_to :item
  validates :card_token, presence: true
end
