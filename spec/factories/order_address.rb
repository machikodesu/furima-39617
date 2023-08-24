FactoryBot.define do
  factory :order_address do
    postal_cord         { '123-4567' }
    prefecture_id { 1 }
    city     { '小平市' }
    street_address          { '1-1' }
    building_name    { 'ハイツ' }
    phone_number     { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end