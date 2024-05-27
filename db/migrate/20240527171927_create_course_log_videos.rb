# frozen_string_literal: true

class CreateCourseLogVideos < ActiveRecord::Migration[7.1]
  def change
    create_table "course_logs_videos" do |t|
      t.references :course_log, null: false, foreign_key: true
      t.integer :time_elapsed_in_seconds

      t.timestamps
    end
  end
end
