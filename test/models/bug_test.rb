require 'test_helper'

class BugTest < ActiveSupport::TestCase
	def setup
		@bug = Bug.create(title: "a title", description: "This is a description of the bug", issue_type: 1, priority: 1, status: 1)
	end

	test "bug must be valid" do 
		assert @bug.valid?
	end

	test "title must be present" do
		@bug.title = ""
		assert_not @bug.valid?

	end

 	test "description must be present" do
		@bug.description = ""
		assert_not @bug.valid?
	end

	test "issue_type must be valid" do
 		invalid_issue_types = [-10, -3, 3, 10]
 		invalid_issue_types.each do |is|
 			begin
 				@bug.issue_type = is
 				assert false, "#{is} should be invalid"
	 		rescue
	 			assert true
	 		end
 		end
	end
	test "issue_type must be issue, enhancement or feature" do
 		valid_issue_types = [:issue, :enhancement, :feature]
 		valid_issue_types.each do |is|
	 		begin
	 			@bug.issue_type = is
				 assert true
	 		rescue
	 			assert false, "#{is} should be invalid"
	 		end
 		end
 	end

 	test "priority must be valid" do
 		invalid_priorities = [-10, -3, 3, 10]
 		invalid_priorities.each do |is|
 			begin
 				@bug.priority = is
 				assert false, "#{is} should be invalid"
	 		rescue
	 			assert true
	 		end
 		end
	end
	test "priority must be low, medium or high" do
 		valid_priorities = [:low, :medium, :high]
 		valid_priorities.each do |is|
	 		begin
	 			@post.priority = is
				 assert true
	 		rescue
	 			assert false, "#{is} should be invalid"
	 		end
 		end
 	end

 	test "status must be valid" do
 		invalid_statuses = [-10, -1, 5, 10]
 		invalid_statuses.each do |is|
 			begin
 				@post.status = is
 				assert false, "#{is} should be invalid"
	 		rescue
	 			assert true
	 		end
 		end
	end
	test "status must be open, closed or monitor" do
 		valid_statuses = [:open, :closed, :monitor]
 		valid_statuses.each do |is|
	 		begin
	 			@post.status = is
				 assert true
	 		rescue
	 			assert false, "#{is} should be invalid"
	 		end
 		end
 	end


end
