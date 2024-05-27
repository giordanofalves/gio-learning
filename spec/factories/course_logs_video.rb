# frozen_string_literal: true

FactoryBot.define do
  factory :course_logs_video, class: CourseLogs::Video do
    time_elapsed_in_seconds { Faker::Number.between(from: 1, to: 1000) }

    course_log
  end
end
