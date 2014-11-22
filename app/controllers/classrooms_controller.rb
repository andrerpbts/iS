class ClassroomsController < ApplicationController
  respond_to :html

  def new
    @classroom = student.classrooms.new
    respond_with @classroom
  end

  def create
    @classroom = student.classrooms.new(classroom_params)
    if @classroom.save
      redirect_to @classroom.student, notice: 'Classroom created'
    else
      respond_with @classroom
    end
  end

  private

  def classroom_params
    params.require(:classroom).permit(:course_id, :entry_at)
  end

  def student
    Student.find(params[:student_id])
  end
end
