class UsersController < ApplicationController
  before_action :set_scores
  def index
    @users = User.all.sort_by &:score
  end

  def show
    @user = User.find(params[:id])
  end

  def set_scores
    User.set_scores
  end
end
