class CoursesController < ApplicationController

  def index
    @courses = Course.all 
  end
  
  def new 
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    end  
  end
 
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  private 

  def course_params
    params.require(:course).permit(:title, :description, :number_credits)
  end

end
