class CollegesController < ApplicationController
before_action :set_college, only: [:show, :edit, :update]
  
  def show
  end
    
  def index
    @colleges = College.all
  end

  def new
    @college = College.new
  end

  def create
    @college = College.new(college_params)
    if @college.save
      flash[:notice] = "College Name was successfully created"
      redirect_to @college
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @college.update(college_params)
      flash[:notice] = "College Name was successfully updated"
      redirect_to @college
    else
      render 'edit'
    end
  end

  private

  def set_college
    @college = College.find(params[:id])
  end

  def college_params
    params.require(:college).permit(:name)
  end

end