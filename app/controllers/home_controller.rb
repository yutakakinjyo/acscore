# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @scores = @user.scores
    now = Time.now
    @last_month = now.last_month
    @date_array = []
    while @last_month != now.tomorrow do
      @size = @scores.where(created_at: @last_month.beginning_of_day..@last_month.end_of_day).size
      if @size > 30 then
        @color = "green"
      elsif @size >= 1 then
        @color = "lightgreen"
      else
        @color = "lightgray"
      end
      @hash = {"date" => @last_month, "score" => @size, "color" => @color}
      @date_array.push(@hash)
      @last_month = @last_month.tomorrow
    end
  end
end
