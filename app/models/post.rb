class Post < ApplicationRecord
  has_one :comment

  # whereのcommentがcommentsになっているのは意図的
  # (調査をしようとしたキッカケになったコードがこうなっていた)
  scope :status_one_comment, -> { left_joins(:comment).where(comments: { status: 1 }) }
  scope :example_comment, -> { joins(:comment).merge(Comment.where(body: 'example')) }
end

# ----- run in rails c
#>Post.status_one_comment.example_comment.to_sql

# rails v7.0.4.3
#>
# SELECT
#   posts.*
# FROM
#   posts
# INNER JOIN
#   comments
# ON
#   comments.post_id = posts.id
# WHERE
#   comments.status = ?
# AND
#   comments.body = ?
#
# [[status, 1], [body, example]]
