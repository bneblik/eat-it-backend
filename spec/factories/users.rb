# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    password { 'password' }
    email { Faker::Internet.email }
    age { rand(30..90) }
    height { rand(150..210) }
    weight { rand(30..120) }
    gender { rand(0..1) }
  end
end
