require 'rails_helper'

RSpec.describe 'Group', type: :request do
  describe 'GET /index' do
    before(:example) do
      @user = User.first
      @first_group = Group.first
      sign_in @user
      get("/groups/#{@first_group.id}/transfers")
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders correct placeholder text' do
      expect(response.body).to include('Total expenses')
    end
  end
end
