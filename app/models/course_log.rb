# frozen_string_literal: true

# == Schema Information
#
# Table name: course_logs
#
#  id         :bigint           not null, primary key
#  kind       :integer          default("video")
#  state      :integer          default("started")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#  user_id    :integer          default(1)
#
# Indexes
#
#  index_course_logs_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
class CourseLog < ApplicationRecord
  belongs_to :course
  has_one :video, class_name: "CourseLogs::Video", dependent: :destroy

  accepts_nested_attributes_for :video

  enum state: { started: 0, in_progress: 1, finished: 2 }
  enum kind:  { video: 0 }

  validates :state, :course_id, presence: true
  validates :course_id, uniqueness: { scope: :kind }

  after_create :create_resource_log

  # the idea is to create a resource log based on the kind of course log
  # for now, only video is supported
  # in the future, we can add more kinds of course logs like quizzes, etc
  def create_resource_log
    case kind
    when "video"
      create_video(course_log: self, time_elapsed_in_seconds: 0)
    end
  end
end
