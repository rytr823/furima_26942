class CardAddress 
  # include ActiveModel::ActiveModel
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,
                :card_token,
                :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number
  with_options presence: true do
  validates :card_token
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, messsgge: "は「-」も入力してください"}
  validates :prefecture_id
  validates :city
  validates :address
  validates :phone_number, format: {with: /\A\d{1,11}\z/, message: "は11桁以内で入力してください"}
  end

  def save
    card = Card.create(card_token: card_token, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, 
                   building_name: building_name, phone_number: phone_number, item_id: item_id)
    Purchase.create(user_id: user_id, item_id: item_id)
  end
end