class CoursesController < ApplicationController
  ##Here we talk that before the show , edit, update, destroy actions we will do set_course 
  before_action :set_course, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end
  
  ##In this action we create a course with all its parameters
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    end  
  end

  def update

    if @course.update(course_params)
      redirect_to courses_path
    else
      render 'edit'
    end
  end
 
  ##In this action we delete the course
  def destroy
    @course.destroy

    redirect_to courses_path
  end

  private 
   
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :number_credits)
  end


end
