class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @score = @user.scores.build()
    @scores = @user.scores
  end
end
