class CourseTest < ApplicationRecord
  has_many :enrollments, as: :assignable
  has_many :results, as: :assignable
  has_many :attempts, as: :assignable
end
