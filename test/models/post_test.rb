require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "scope chain" do
    posts = Post.status_one_comment.example_comment
    assert posts.count == 0
  end
end
