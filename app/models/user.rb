class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments
  
  def post_comments(post)
    post = Post.find(post.id)
    post.comments.select { |comment| comment.user_id == self.id }
  end
end
