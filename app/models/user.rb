class User < ActiveRecord::Base
  has_many :taught_courses, class_name: "Course"
  has_many :enrollments
  has_many :enrolled_courses, :through => :enrollments, :source => :course
  # Class: EnrolledCourse
  # ID/association enrolled_course_id


  has_many :widgets, through: :enrollments
  # Class name: Widget
  # Foreign key: widget_id


  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def enrolled_in?(course)

    # enrolled_courses = enrollments.collect(&:course)

    # enrolled_courses = enrollments.collect do |enrollment|
    #     enrollment.course
    # end

    # enrolled_courses = []
    # enrollments.each do |enrollment|
    #   enrolled_courses << enrollment.course
    # end

    return enrolled_courses.include?(course)
  end
end
