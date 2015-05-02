require 'test_helper'

class EntryTest < ActiveSupport::TestCase
 def setup
 	@user = users(:michael)
 	@entry = Entry.new(title: "New entry", body: "Loren ipsum",
 					  	user_id: @user.id )
 end

 test "should be valid" do
 	assert @entry.valid?
 end

 test "user id should be present" do
	@entry.user_id = nil
	assert_not @entry.valid? 	
 end

 test "title should be present" do
 	@entry.title = nil
 	assert_not @entry.valid?
 end

 test "body should be present" do
 	@entry.body = nil
 	assert_not @entry.valid?
 end

 test "title should be at most 140 characters" do
 	@entry.title = "a"*141
 	assert_not @entry.valid?
 end

 test "body should be at most 140 characters" do
 	@entry.body = "a" * 141
 	assert_not @entry.valid?
 end

 test "order should be most recent first" do
 	assert_equal Entry.first, entries(:most_recent)
 end

 test "associated comments should be destroyed" do
 	@entry.save
 	@entry.comments.create!(user_id:"1", content: "lorum ipsum")
 	assert_difference 'Comment.count' , -1 do
 		@entry.destroy
 	end
 end

end
