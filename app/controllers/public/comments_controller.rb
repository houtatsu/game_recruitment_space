class Public::CommentsController < ApplicationController
  def create
    recruitment = Recruitment.find(params[:recruitment_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.recruitment_id = recruitment.id
    @comment.save
    redirect_to public_recruitment_path(recruitment.id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_recruitment_path(params[:recruitment_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
