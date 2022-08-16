class UsersController < ApplicationController
  def index
    if params[:status]
      @users = User.filter_by_status(params[:status])
    else
      @users = User.all
    end
    @users = @users.order(params[:sort]).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end
end
