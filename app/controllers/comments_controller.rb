class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
    
    compar = params.require(:comment)
    if compar[:user_attributes][:username].length > 0
      compar.permit(:content, :post_id, user_attributes:[:username])
    else
      compar.permit(:content, :post_id, :user_id)
    end
  end
end
