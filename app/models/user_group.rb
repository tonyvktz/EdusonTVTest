class UserGroup < ApplicationRecord
  include BaseEducable

  has_many :enrollments, as: :educable

  def course_enrollments
    enrollments.where(assignable_type: :Course)
  end

  def test_enrollments
    enrollments.where(assignable_type: :CourseTest)
  end
end
