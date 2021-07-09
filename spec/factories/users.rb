FactoryBot.define do
  factory :user do
    nickname              { 'まつもと' }
    email                 {Faker::Internet.free_email}
    password              { 'atsuya070108' }
    password_confirmation { 'atsuya070108' }
    first_name           { '松本' }
    last_name            { '篤也' }
    first_name_kana      { 'マツモト' }
    last_name_kana       { 'アツヤ' }
    birthday             { '1995-01-08' }
  end
end
