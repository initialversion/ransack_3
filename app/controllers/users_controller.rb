class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(:distinct => true).includes(:photos, :comments, :votes).page(params[:page]).per(params[:per_page])
  end

  def show
    @user = User.find(params[:id])
  end
end
