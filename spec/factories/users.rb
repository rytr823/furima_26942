FactoryBot.define do
  factory :user do
    nickname              { 'tanaka' }
    email                 { 'aaa@gmail.com' }
    password              { 'a0000000' }
    password_confirmation { 'a0000000' }
    family_name           { '田中' }
    last_name             { '太郎' }
    family_name_katakana  { 'タナカ' }
    last_name_katakana    { 'タロウ' }
    birthday              { '1999-01-01' }
  end
end
