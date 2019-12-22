class TravelsController < ApplicationController
  before_action :require_user_logged_in, only: [:new]
  
  def new
    @prefecture = Prefecture.find(params[:id])
    @travel = current_user.travels.build(prefecture_id: params[:id])
  end
  
  def show
    @travel = Travel.find(params[:id])
  end
  
  def create
    @travel = current_user.travels.build(travel_params)
    if @travel.save
      flash[:success] = "新規項目を作成しました。"
      redirect_to "/prefectures/#{@travel.prefecture_id}"
    else
      flash.now[:danger] = "新規項目の作成に失敗しました。"
      render :new
    end
  end

private

  def travel_params
    params.require(:travel).permit(:resource, :prefecture_id)
  end
  
end