FactoryGirl.define do
  factory :admin, class: 'AdminApp::Admin' do
    email { Faker::Internet.free_email }
    password '12345678'
    password_confirmation '12345678'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    confirmed_at DateTime.now
  end
end
