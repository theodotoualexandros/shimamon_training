require 'rails_helper'

RSpec.describe ProfileController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  #let(:valid_attributes) {
    #{ image: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'brands', 'logos', '123.jpg'), 'image/jpeg')  }
  #}
  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns http success" do
      sign_in user
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    before(:each) do
      sign_in user
    end
    context "with valid params" do
      let(:new_attributes) {
        { image: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'brands', 'logos', '123.jpg'), 'image/jpeg') }
      }
      it "returns http success" do
        sign_in user
        put :update, params: { id: user.to_param, user: new_attributes}, session: valid_session
        expect(response).to redirect_to(profile_path)
      end
    end
  end

end
