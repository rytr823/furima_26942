class Address < ApplicationRecord
  belongs_to :item
  # belongs_to_active_hash :prefecture
end
