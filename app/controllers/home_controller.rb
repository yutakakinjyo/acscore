class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @scores = @user.scores    
  end
end