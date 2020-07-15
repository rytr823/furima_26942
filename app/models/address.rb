class Address < ApplicationRecord
  belongs_to :item
  belongs_to_active_hash :prefecture
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, messsgge: 'は「-」も入力してください' }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{1,11}\z/, message: 'は11桁以内で入力してください' }
  end
end
