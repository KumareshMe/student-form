class CoursesController < ApplicationController

  def show
    @course = Course.find(params[:id])
  end

  def index
    @courses = Course.all
  end

  def new
      @course = Course.new
  end

  def edit
      @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course was successfully created"
      redirect_to @course
    else
      render 'new'
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice] = "Course was successfully updated"
      redirect_to @course
    else
      render 'edit'
    end
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end
  
end