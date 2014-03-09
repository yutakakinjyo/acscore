class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    # TODO: form_for の引数で必要だが、controller でnewできるので、消し去りたい. form_for を引数なしでできればいい
    @score = Score.new
    @scores = @user.scores
    @now = Time.now
    @last_month = @now.last_month
    @date_array = []
    while @last_month != @now.tomorrow do
      @size = @scores.where(created_at: @last_month.beginning_of_day..@last_month.end_of_day).size
      @hash = {"date" => @last_month, "score" => @size}
      @date_array.push(@hash)
      @last_month = @last_month.tomorrow
    end
  end
end
