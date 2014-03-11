# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @scores = current_user.scores
    now = Time.now
    current_date = now.last_month
    @date_array = []
    while current_date != now.tomorrow do
      day_score = @scores.where(created_at: current_date.beginning_of_day..current_date.end_of_day).size
      color = get_color(day_score)
      @date_array << {"date" => current_date, "color" => color}
      current_date = current_date.tomorrow
    end
  end
  
  def get_color score
      if score > 30 then
        return "green"
      elsif score >= 1 then
        return "lightgreen"
      else
        return "lightgray"
      end
  end

end
