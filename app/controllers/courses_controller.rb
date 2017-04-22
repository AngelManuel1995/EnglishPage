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

    respond_to do |format|
      if @course.save
        format.html{redirect_to courses_path, notice: 'Course created sucessful.'}
      else
        format.html{render 'new'}
      end
    end  
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
       format.html{ redirect_to courses_path, notice: 'Course updated sucessful.'}
      else
        format.html{render 'edit'}
      end
    end
  end
 
  ##In this action we delete the course
  def destroy
    @course.destroy
    respond_to do |format| 
      format.html{redirect_to courses_path, notice: 'Course deleted sucessful.'}
    end
  end

  private 
   
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :number_credits, :cover)
  end


end
