json.(@student, :name, :register_number, :status, :status_text, :created_at, :updated_at)

json.clasrooms @student.classrooms, :entry_at, :course_id, :course_name
