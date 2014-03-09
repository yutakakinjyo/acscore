class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    # TODO: form_for の引数で必要だが、controller でnewできるので、消し去りたい. form_for を引数なしでできればいい
    @score = Score.new
    @scores = @user.scores
    @now = Time.now
    @last_month = @now.last_month
    @da = []
    while @last_month != @now do
      @da.push(@last_month)
      @last_month = @last_month.tomorrow
    end

  end
end
