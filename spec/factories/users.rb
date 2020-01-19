# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    nick { Faker::Name.initials }
    password { 'password' }
    email { Faker::Internet.email }
    age { 23 }
    phone_number { '+48543987456' }
  end
end
