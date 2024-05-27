# frozen_string_literal: true

# == Schema Information
#
# Table name: course_logs_videos
#
#  id                      :bigint           not null, primary key
#  time_elapsed_in_seconds :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  course_log_id           :bigint           not null
#
# Indexes
#
#  index_course_logs_videos_on_course_log_id  (course_log_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_log_id => course_logs.id)
#
module CourseLogs
  def self.table_name_prefix
    "course_logs_"
  end

  class Video < ApplicationRecord
    belongs_to :course_log

    before_save :convert_time_elapsed_in_seconds

    def convert_time_elapsed_in_seconds
      self.time_elapsed_in_seconds = time_elapsed_in_seconds.to_i
    end
  end
end
