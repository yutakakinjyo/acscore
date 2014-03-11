# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @scores = current_user.scores
    now = Time.now
    current_month = now.last_month
    @date_array = []
    while current_month  != now.tomorrow do
      size = @scores.where(created_at: current_month.beginning_of_day..current_month.end_of_day).size
      if size > 30 then
        color = "green"
      elsif size >= 1 then
        color = "lightgreen"
      else
        color = "lightgray"
      end
      @date_array << {"date" => current_month, "color" => color}
      current_month = current_month.tomorrow
    end
  end
end
