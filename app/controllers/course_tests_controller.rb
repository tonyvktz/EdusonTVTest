class CourseTestsController < ApplicationController
  before_action :set_course_test, only: [:show, :edit, :update, :destroy]

  # GET /course_tests
  # GET /course_tests.json
  def index
    @course_tests = CourseTest.all
  end

  # GET /course_tests/1
  # GET /course_tests/1.json
  def show
  end

  # GET /course_tests/new
  def new
    @course_test = CourseTest.new
  end

  # GET /course_tests/1/edit
  def edit
  end

  # POST /course_tests
  # POST /course_tests.json
  def create
    @course_test = CourseTest.new(course_test_params)

    respond_to do |format|
      if @course_test.save
        format.html { redirect_to @course_test, notice: 'Course test was successfully created.' }
        format.json { render :show, status: :created, location: @course_test }
      else
        format.html { render :new }
        format.json { render json: @course_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_tests/1
  # PATCH/PUT /course_tests/1.json
  def update
    respond_to do |format|
      if @course_test.update(course_test_params)
        format.html { redirect_to @course_test, notice: 'Course test was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_test }
      else
        format.html { render :edit }
        format.json { render json: @course_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_tests/1
  # DELETE /course_tests/1.json
  def destroy
    @course_test.destroy
    respond_to do |format|
      format.html { redirect_to course_tests_url, notice: 'Course test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_test
      @course_test = CourseTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_test_params
      params.require(:course_test).permit(:name)
    end
end
