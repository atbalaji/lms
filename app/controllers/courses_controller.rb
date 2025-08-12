class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin_or_instructor!, except: [:index, :show]
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)

    if @course.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @course, notice: "Course created successfully." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to courses_path, notice: "Course updated" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to courses_path, notice: "Course deleted" }
    end
  end

  private

  def authorize_admin_or_instructor!
    unless current_user.admin? || current_user.instructor?
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description)
  end
end
