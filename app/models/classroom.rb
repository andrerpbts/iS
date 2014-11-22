class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student, :course, :entry_at, presence: true
end
