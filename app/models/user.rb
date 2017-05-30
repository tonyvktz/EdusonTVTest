class User < ApplicationRecord
  include BaseEducable

  belongs_to :user_group, optional: true
  has_secure_password

  has_many :enrollments, as: :educable
  has_many :results

  def raw_enrollments
    Enrollment.where(educable_type: :User, educable_id: id)
  end

  def from_group_enrollments
    Enrollment.where(educable_type: :UserGroup, educable_id: user_group_id)
  end

  def course_enrollments
    raw_enrollments.where(assignable_type: :Course).or(
        from_group_enrollments.where(assignable_type: :Course))
  end

  def test_enrollments
    raw_enrollments.where(assignable_type: :CourseTest).or(
        from_group_enrollments.where(assignable_type: :CourseTest))
  end

  def done_courses_results
    results.where(assignable_type: :Course)
  end

  def done_tests_results
    results.where(assignable_type: :CourseTest)
  end
end
