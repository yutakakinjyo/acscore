require 'spec_helper'

describe User do

  describe "total_score" do
    before do
      @user = User.new
      @user.save(validate: false)
    end

    context "call total score" do
      it "has one socre" do
        @user.scores.create
        expect(@user.total_score).to eq(1)
      end
      it "has zero socre" do
        expect(@user.total_score).to eq(0)
      end
    end
  end

  describe "score_calendar" do
    before do
      @user = User.new
      @user.save(validate: false)
      @time_now = Time.local(1987,5,9,0,0,0)
      Time.stub!(:now).and_return(@time_now)
    end

    context "call score_calendar" do
      it "has zero socre" do
        expect(@user.score_calendar.first).to eq({"date"=> @time_now.last_month, "color" => "lightgray"})
        expect(@user.score_calendar.last).to eq({"date"=> @time_now, "color" => "lightgray"})
      end
    end
  end

end

