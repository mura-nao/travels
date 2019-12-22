class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def new
    @travel = Travel.find(params[:id])
    @comment = current_user.comments.build(travel_id: params[:id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメントを投稿しました。"
      redirect_to "/travels/#{@comment.travel_id}"
    else
      flash.now[:danger] = "コメントの投稿に失敗しました。"
      render :new
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content, :travel_id)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
  
end
