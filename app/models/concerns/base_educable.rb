module BaseEducable

  def all_courses
    Course.joins(:enrollments).merge(course_enrollments)
  end

  def all_tests
    CourseTest.joins(:enrollments).merge(test_enrollments)
  end

  def courses
    Course.joins(:enrollments).merge(enrollments.where(assignable_type: :Course))
  end

  def tests
    CourseTest.joins(:enrollments).merge(enrollments.where(assignable_type: :CourseTest))
  end
end