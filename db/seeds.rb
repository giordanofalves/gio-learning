# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Course.find_or_create_by!(
  title: "Ocean fishing",
  description: "Learn how to dive like a majestic bird.",
  thumbnail_url: 'https://source.unsplash.com/flying-bird-over-body-of-water-MPYUwhE8Jjs',
  video_url: '//vjs.zencdn.net/v/oceans.mp4'
)

Course.find_or_create_by!(
  title: "Driving a car",
  description: "Learn how to drive a car like a pro.",
  thumbnail_url: 'https://source.unsplash.com/car-on-road-near-mountain-during-daytime-a_5DTTj_zm4',
  video_url: '//archive.org/download/CEP217/CEP217_512kb.mp4'
)