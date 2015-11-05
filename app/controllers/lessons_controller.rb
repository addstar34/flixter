class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_enrollment_for_current_course, :only => [:show]
	
	def show
	end

	private
	
	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end
	
	def require_enrollment_for_current_course
		if !current_user.enrolled_in?(current_lesson.section.course) && current_lesson.section.course.user != current_user
			redirect_to course_path(current_lesson.section.course), :alert => 'Please enroll to view lessons.'
		end
	end
end
