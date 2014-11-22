class StudentsController < ApplicationController
  respond_to :html, :json

  def index
    @students = Student.order(:name)
    respond_with @students
  end

  def show
    @student = Student.includes(classrooms: :course).find(params[:id])
    respond_with @students
  end

  def new
    @student = Student.new
    respond_with @student
  end

  def create
    @student = Student.new(student_params)
    flash['success'] = 'Student created' if @student.save
    respond_with @student
  end

  def edit
    @student = Student.find(params[:id])
    respond_with @student
  end

  def update
    @student = Student.find(params[:id])
    flash['success'] = 'Student updated' if @student.update(student_params)
    respond_with @student
  end

  private

  def student_params
    params.require(:student).permit(:name, :register_number, :status)
  end
end
