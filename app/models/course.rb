class Course < ActiveRecord::Base
  extend Enumerize

  validates :name, :description, presence: true

  STATUSES = { active: 1, inactive: 2 }
  enumerize :status,
            in: STATUSES,
            default: :active,
            predicates: { prefix: true },
            scope: true
end
