class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @score = Score.new
    @scores = @user.scores
  end
end
