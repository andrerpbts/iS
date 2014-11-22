class Course < ActiveRecord::Base
  extend Enumerize

  has_many :classrooms
  has_many :students, through: :classrooms

  validates :name, :description, presence: true

  STATUSES = { active: 1, inactive: 2 }
  enumerize :status,
            in: STATUSES,
            default: :active,
            predicates: { prefix: true },
            scope: true
end
