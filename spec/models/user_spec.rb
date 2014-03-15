require 'spec_helper'

describe User do
  describe "total_score" do
    before do
      @user = User.new
      score = score.new
      score.user_id = @user.id
      @user.save
      score.save
    end
    context "get total score" do
      it "total score is 1" do
       @user.total_score.should 1
      end
    end
  end
end
