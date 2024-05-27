# frozen_string_literal: true

FactoryBot.define do
  factory :course_log do
    user_id         { 1 }
    traits_for_enum :kind, CourseLog.kinds
    traits_for_enum :state, CourseLog.states

    course

    trait :with_video do
      after(:build) do |course_log|
        build(:course_logs_video, course_log:)
      end
    end
  end
end
