require 'spec_helper'

describe Api::V1::RolesController do

  let(:user) { FactoryGirl.create(:user) }
  let(:role) { FactoryGirl.create(:role) }

  context 'when user signed in' do
    before { sign_in user }

    describe "GET index" do

    end

    describe "GET show" do

    end

    describe "GET new" do

    end

    describe "GET edit" do

    end

    describe "POST create" do
      describe "with valid params" do

      end

      describe "with invalid params" do

      end
    end

    describe "PUT update" do
      describe "with valid params" do

      end

      describe "with invalid params" do

      end
    end

    describe "DELETE destroy" do

    end
  end
end
