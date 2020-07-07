class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage_pay
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_until_shipping

  has_one_attached :image
  # validate :image_should_be_presence
  # def image_should_be_presence
  #   if !image.attached?
  #     errors.add(:image, 'を添付してください')
  #   end
  # end
  validates_presence_of :image

  # def blob_is_image?
  #   image.blob.content_type == 'application/zip' && image.blob.filename.extension_without_delimiter == 'image'
  # end

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
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :postage_pay_id
    validates :days_until_shipping_id
  end

  validates :price, inclusion: { in: 300..9_999_999 }
end
