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
require "rails_helper"

RSpec.describe CourseLog, type: :model do
  subject { create(:course_log) }

  describe "associations" do
    it { should belong_to(:course) }
    it { should have_one(:video).class_name("CourseLogs::Video").dependent(:destroy) }
  end

  describe "nested attributes" do
    it { should accept_nested_attributes_for(:video) }
  end

  describe "enums" do
    it { should define_enum_for(:state).with_values(started: 0, in_progress: 1, finished: 2) }
    it { should define_enum_for(:kind).with_values(video: 0) }
  end

  describe "validations" do
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:course_id) }
    it { should validate_uniqueness_of(:course_id).scoped_to(:kind) }
  end

  describe "callbacks" do
    describe "after_create" do
      it "should create a video resource log for video kind" do
        course_log = create(:course_log, kind: "video")

        expect(course_log.video).to be_present
        expect(course_log.video.course_log).to eq(course_log)
        expect(course_log.video.time_elapsed_in_seconds).to eq(0)
      end
    end
  end
end
