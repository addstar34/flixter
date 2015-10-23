require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
	test "create course" do
		user = FactoryGirl.create(:user)
		sign_in user
		assert_difference('Course.count') do
			post :create, :user_id => user.id, :course => {
				:title => "Course Title",
				:description => "This is the course description.",
				:cost => "1.99"
			}
		end
		assert_equal 1, Course.count
		assert_redirected_to instructor_course_path(Course.first)
	end
end