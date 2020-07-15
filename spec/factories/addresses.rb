FactoryBot.define do
  factory :address do
    postal_code     { '111-1111' }
    prefecture_id   { '1' }
    city            { '札幌' }
    address         { '1' }
    building_name   { '' }
    phone_number    { '12345678910' }
    association :item
  end
end
