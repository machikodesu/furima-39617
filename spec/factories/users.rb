FactoryBot.define do
  factory :user do
    nickname   { Faker::Name.initials }
    email      { Faker::Internet.email }
    password   { Faker::Internet.password(min_length: 6) + '1' }
    password_confirmation { password }
    last_name   { 'やマ田' }
    first_name  { '太ろウ' }
    last_name_k  { 'ヤマダ' }
    first_name_k { 'タロウ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
