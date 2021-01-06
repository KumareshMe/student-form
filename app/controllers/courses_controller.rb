class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update]

  def show
  end

  def index
    @courses = Course.all
  end

  def new
      @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course Name was successfully created"
      redirect_to @course
    else
      render 'new'
    end
  end

  def update
    if @course.update(course_params)
      flash[:notice] = "Course Name was successfully updated"
      redirect_to @course
    else
      render 'edit'
    end
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end

  def set_course
    @course = Course.find(params[:id])
  end
  
end