# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    description   { Faker::Lorem.sentence }
    thumbnail_url { Faker::Internet.url }
    title         { Faker::Lorem.words(number: 3).join(" ") }
    video_url     { Faker::Internet.url }
  end
end
