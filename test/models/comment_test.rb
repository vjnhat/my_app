require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
  	@user = users(:michael)
  	@entry = entries(:cat_video)
  	@comment = Comment.new(content:"Lorum ipsum", user_id: @user.id, entry_id: @entry.id)
  end

  test "should be valid?" do
  	assert @comment.valid?
  end

  test "user id should be present" do
  	@comment.user_id = nil
  	assert_not @comment.valid?
  end

  test "entry id should be present" do
  	@comment.entry_id = nil
  	assert_not @comment.valid?
  end

  test "content should be present" do
  	@comment.content = " "
  	assert_not @comment.valid?
  end

  test "content should be at most 140 characters" do
  	@comment.content = "a" *141
  	assert_not @comment.valid?
  end

  test "order should be most recent first" do
  	assert_equal Comment.first, comments(:most_recent)
  end
end
