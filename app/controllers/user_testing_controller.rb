class UserTestingController < ApplicationController
  before_action :setup_current_user

  def index
    @courses_results = results_to_hash(@user.done_courses_results)
    @tests_results = results_to_hash(@user.done_tests_results)
    @courses = @user.all_courses
    @course_tests = @user.all_tests
  end

  def pass
    attempt = Attempt.new(user: @user, success: params[:success])
    assignable.attempts << attempt
    result = update_result(attempt)
    flash[:notice] = if attempt.save && result.save
                       'Test or course successfully passed'
                     else
                       'Error pass test or course!'
                     end
    redirect_to(user_testing_path(@user))
  end

  private

  def update_result(attempt)
    result = Result.find_by(user: @user, assignable_type: params[:assignable_type], assignable_id: params[:assignable_id])
    if result
      result.update(success: attempt.success, attempt: attempt)
    else
      result = Result.new(user: @user, success: attempt.success, attempt: attempt)
      assignable.results << result
    end
    result
  end

  def setup_current_user
    @user = User.find(params[:id])
  end

  def assignable
    id = params[:assignable_id]
    params[:assignable_type] == 'CourseTest' ? CourseTest.find(id) : Course.find(id)
  end

  def results_to_hash(collection)
    hash = {}
    collection.each { |res| hash[res.assignable_id] = res }
    hash
  end
end
