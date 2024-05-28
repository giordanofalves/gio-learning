# frozen_string_literal: true

class CourseLogsController < ApplicationController
  before_action :set_course, only: %i[create]
  before_action :set_course_log, only: %i[update]

  def create
    @course_log = @course.course_logs.find_or_create_by(course_log_params)

    if @course_log.save
      render json: { course_log: JSON.parse(@course_log.to_json(include: :video)) }, status: :created
    else
      render json: @course_log.errors, status: :unprocessable_entity
    end
  end

  def update
    if @course_log.update(course_log_params)
      render json: { course_log: JSON.parse(@course_log.to_json(include: :video)) }, status: :ok
    else
      render json: @course_log.errors, status: :unprocessable_entity
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_course_log
    @course_log = CourseLog.find(params[:id])
  end

  def course_log_params
    params.require(:course_log).permit(:id, :state, :kind, :course_id, video_attributes: [:time_elapsed_in_seconds])
  end
end
