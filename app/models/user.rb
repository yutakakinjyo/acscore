class User < ActiveRecord::Base
  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :scores

  def score_calendar
    scores = self.scores
    now = Time.now
    current_date = now.last_month
    date_array = []
    while current_date != now.tomorrow do
      day_score = scores.where(created_at: current_date.beginning_of_day..current_date.end_of_day).size
      color = map_color(day_score)
      date_array << {"date" => current_date, "color" => color}
      current_date = current_date.tomorrow
    end
    return date_array
  end

  def total_score
    return self.scores.size
  end

  private

  def map_color score
    if score > 30 then
      return "green"
    elsif score >= 1 then
      return "lightgreen"
    else
      return "lightgray"
    end
  end

end
