class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user! 
  before_action :require_authorized_for_current_user

  def new
    @section = Section.new 
  end

  def create 
    @section = current_course.sections.create(sections_params)
    redirect_to instructor_course_path(current_course)
  end

  private

  def require_authorized_for_current_user
    if current_course.user != current_user
       render :text => "Unauthorized", :status => :unauthorized
    end
  end

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:course_id])
  end

  def sections_params
    params.require(:section).permit(:title)
  end

end
