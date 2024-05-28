# frozen_string_literal: true

require "rails_helper"

RSpec.describe CourseLogs do
  let(:video) { create(:course_logs_video) }

  describe ".table_name_prefix" do
    it "returns the correct table name prefix" do
      expect(CourseLogs.table_name_prefix).to eq("course_logs_")
    end
  end

  describe "#convert_time_elapsed_in_seconds" do
    it "converts time_elapsed_in_seconds to an integer" do
      video.time_elapsed_in_seconds = 10.5
      video.save

      expect(video.time_elapsed_in_seconds).to eq(10)
    end

    it "does not convert already integer time_elapsed_in_seconds" do
      video.time_elapsed_in_seconds = 20
      video.save

      expect(video.time_elapsed_in_seconds).to eq(20)
    end
  end
end
