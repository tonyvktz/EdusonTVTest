class AdminEnrollmentController < ApplicationController
  before_action :setup_educable
  skip_before_action :setup_educable, only: :index

  def index
    @users = User.all
    @groups = UserGroup.all
  end

  def new
    @assigned_courses = @educable.course_enrollments.pluck(:assignable_id)
    @assigned_tests = @educable.test_enrollments.pluck(:assignable_id)
    @courses = Course.all
    @course_tests = CourseTest.all
  end

  def edit
    @courses = @educable.courses
    @course_tests = @educable.tests
  end

  def show
    @courses = @educable.all_courses
    @course_tests = @educable.all_tests
  end

  def create
    enrollment = Enrollment.new
    @educable.enrollments << enrollment
    assignable.enrollments << enrollment
    flash[:notice] = if enrollment.save
                       'Enrollment was successfully created.'
                     else
                       'Error create enrollment!'
                     end
    redirect_to(new_admin_enrollment_path(@educable,
                                          educable_type: @educable_type))
  end

  def destroy
    enrollment = Enrollment.find_by(
        educable_id: params[:id],
        educable_type: params[:educable_type],
        assignable_id: params[:assignable_id],
        assignable_type: params[:assignable_type]
    )
    if enrollment
      enrollment.destroy
      flash[:notice] = 'Enrollment was successfully deleted.'
    else
      flash[:notice] = 'Error deletion! Enrollment not found.'
    end
    redirect_to(edit_admin_enrollment_path(@educable,
                                           educable_type: @educable_type))
  end

  private

  def setup_educable
    @educable_type = params[:educable_type]
    @educable = educable
  end

  def educable
    id = params[:id]
    params[:educable_type] == 'UserGroup' ? UserGroup.find(id) : User.find(id)
  end

  def assignable
    id = params[:assignable_id]
    params[:assignable_type] == 'CourseTest' ? CourseTest.find(id) : Course.find(id)
  end
end
