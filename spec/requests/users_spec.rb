require 'rails_helper'

RSpec.describe "Users", type: :request do
  fixtures :users
  
  describe "GET /users" do
    subject (:user) { users(:trainee) }
    
    it "returns http success" do
      get "/users"      
      expect(response).to have_http_status(:success)      
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET /show" do
    subject (:user) { users(:trainee) }
    
    it "returns http success" do
      get "/users/#{users(:trainee).id}"  
      expect(response).to have_http_status(:success)
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/users/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/users/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/users/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/users/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
