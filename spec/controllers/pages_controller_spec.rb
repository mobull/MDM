require 'spec_helper'

describe PagesController do
  let(:user) { FactoryGirl.create(:user) }

  context 'when user signed in' do
    before { sign_in user }

    describe "GET 'dashboard'" do
      it "returns http success" do
        get 'dashboard'
        response.should be_success
      end
    end
  end
end
