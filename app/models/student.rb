class Student < ActiveRecord::Base
  validates :name, :register_number, presence: true
  validates :register_number, uniqueness: true
end
