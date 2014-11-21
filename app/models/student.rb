class Student < ActiveRecord::Base
  extend Enumerize

  validates :name, :register_number, presence: true
  validates :register_number, uniqueness: true

  STATUSES = { enabled: 1, disabled: 2 }
  enumerize :status,
            in: STATUSES,
            default: :enabled,
            predicates: { prefix: true },
            scope: true
end
