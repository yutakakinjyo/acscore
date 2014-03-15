require 'spec_helper'

describe User do
  describe "total_score" do
    before do
      @user = User.new
      @user.save(validate: false)
      @user.scores.create
    end
    context "call total score" do
      it "has one socre" do
       expect(@user.total_score).to eq(1)
      end
    end
  end
end
