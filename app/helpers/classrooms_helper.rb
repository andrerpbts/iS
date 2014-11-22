module ClassroomsHelper
  def active_courses
    Course.order(:name).with_status(:active)
  end
end
