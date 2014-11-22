class CoursesController < ApplicationController
  respond_to :html, :json

  def index
    @courses = Course.order(:name)
    respond_with @courses
  end

  def show
    @course = Course.find(params[:id])
    respond_with @courses
  end

  def new
    @course = Course.new
    respond_with @course
  end

  def create
    @course = Course.new(course_params)
    flash['success'] = 'Course created' if @course.save
    respond_with @course
  end

  def edit
    @course = Course.find(params[:id])
    respond_with @course
  end

  def update
    @course = Course.find(params[:id])
    flash['success'] = 'Course updated' if @course.update(course_params)
    respond_with @course
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :status)
  end
end
