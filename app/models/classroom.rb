class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student, :course, :entry_at, presence: true
  validates :course_id, uniqueness: { scope: [:student_id] }

  delegate :name, to: :course, prefix: true
  delegate :name, to: :student, prefix: true
end
