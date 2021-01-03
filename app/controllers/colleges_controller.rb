class CollegesController < ApplicationController
    
    def show
        @college = College.find(params[:id])
    end
    
    def index
        @college = College.all
    end

    def new
        @college = College.new
    end

    def create
        @college = College.new(college_params)
        if @college.save
          flash[:notice] = "College was successfully created"
          redirect_to @college
        else
          render 'new'
        end
    end

    private

   def college_params
    params.require(:college).permit(:name)
   end

end