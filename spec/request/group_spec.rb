require 'rails_helper'

RSpec.describe 'Group', type: :request do
  describe 'GET /index' do
    before(:example) do
      @user = User.first
      sign_in @user
      get(groups_path)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders correct placeholder text' do
      expect(response.body).to include('Categories')
    end
  end

  describe 'GET /groups/new' do
    before(:example) do
      @user = User.first
      sign_in @user
      get(new_group_path)
    end
    it "renders 'new' template" do
      expect(response).to render_template('new')
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
