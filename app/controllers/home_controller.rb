# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @score_calendar = current_user.score_calendar
    @total_score = current_user.total_score
  end

end
