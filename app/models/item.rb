class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage_pay
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_until_shipping

  with_options presence: true do |assoc|
    assoc.validates :name
    assoc.validates :image
    assoc.validates :introduction
    assoc.validates :price
    assoc.validates :seles_commission
    assoc.validates :seles_profit
    assoc.validates :category_id
    assoc.validates :status_id
    assoc.validates :postage_id
    assoc.validates :shipping_area_id
    assoc.validates :days_until_shipping_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :shipping_area_id
    validates :days_until_shipping_id
  end
end
