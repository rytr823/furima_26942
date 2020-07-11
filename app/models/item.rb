class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage_pay
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_until_shipping

  belongs_to :user
  has_one :purchase
  has_one :card, dependent: :destroy

  has_one_attached :image
  validates_presence_of :image

  with_options presence: true do |assoc|
    assoc.validates :name
    assoc.validates :introduction
    assoc.validates :price
    assoc.validates :sales_commission
    assoc.validates :sales_profit
    assoc.validates :category_id
    assoc.validates :status_id
    assoc.validates :postage_pay_id
    assoc.validates :shipping_area_id
    assoc.validates :days_until_shipping_id
    assoc.validates :user
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :postage_pay_id
    validates :days_until_shipping_id
  end

  validates :price, inclusion: { in: 300..9_999_999 }
end
