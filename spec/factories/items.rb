FactoryBot.define do
  factory :item do
    name                   { 'test' }
    introduction           { 'testです。' }
    price                  { '1000' }
    sales_commission       { '100' }
    sales_profit           { '900' }
    category_id            { '2' }
    status_id              { '2' }
    postage_pay_id         { '2' }
    shipping_area_id       { '2' }
    days_until_shipping_id { '2' }
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'sample.jpg')), filename: 'sample.jpg')
    end
    association :user
  end
end
