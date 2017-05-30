require 'test_helper'

class CourseTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_test = course_tests(:one)
  end

  test "should get index" do
    get course_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_course_test_url
    assert_response :success
  end

  test "should create course_test" do
    assert_difference('CourseTest.count') do
      post course_tests_url, params: { course_test: { name: @course_test.name } }
    end

    assert_redirected_to course_test_url(CourseTest.last)
  end

  test "should show course_test" do
    get course_test_url(@course_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_test_url(@course_test)
    assert_response :success
  end

  test "should update course_test" do
    patch course_test_url(@course_test), params: { course_test: { name: @course_test.name } }
    assert_redirected_to course_test_url(@course_test)
  end

  test "should destroy course_test" do
    assert_difference('CourseTest.count', -1) do
      delete course_test_url(@course_test)
    end

    assert_redirected_to course_tests_url
  end
end
