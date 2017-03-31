class CoursesController < ApplicationController

  def index
  
  end
  
  def new 
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to root_path
    end  
  end
 

  private 

  def course_params
    params.require(:course).permit(:title, :description, :number_credits)
  end

end
