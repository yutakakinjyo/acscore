class HomeController < ApplicationController
  def index
    @user = current_user
    @scores = @user.scores    
  end
end
