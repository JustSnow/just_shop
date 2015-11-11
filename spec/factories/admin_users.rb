FactoryGirl.define do
  factory :admin_user do
    email { Faker::Internet.free_email }
    password '12345678'
    password_confirmation '12345678'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    after :build do |admin_user|
      admin_user.full_name = [admin_user.first_name, admin_user.last_name].join(' ')
    end
  end
end
