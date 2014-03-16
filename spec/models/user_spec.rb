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
end
