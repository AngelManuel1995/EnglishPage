class CoursesController < ApplicationController

  ##In this action we load each course  
  def index
    @courses = Course.all 
  end

  ##In this action we create a course empty
  def new 
    @course = Course.new
  end

  ##In this action we can showing a course
  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end
  
  ##In this action we create a course with all its parameters
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    end  
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to courses_path
    else
      render 'edit'
    end
  end
 
  ##In this action we delete the course
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
