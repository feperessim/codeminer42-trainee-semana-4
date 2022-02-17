require 'rails_helper'

RSpec.describe "Users", type: :request do
  fixtures :users
  
  describe "GET /users" do
    subject (:user) { users(:trainee) }
    
    it "returns http success" do
      get users_path
      expect(response).to have_http_status(:success)      
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET /show" do
    subject (:user) { users(:trainee) }
    
    it "returns http success" do
      get user_path(user)
      expect(response).to have_http_status(:success)
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get users_new_path
      expect(response).to have_http_status(:success)
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST /create" do
    context "when a new user is created" do
      it "returns http status created" do
        expect {
          post users_path({ "user": { "name":"New user", "age": "32", "biography":"Hello world" } })
        }.to change {  User.count }
        expect(response).to have_http_status(:found)
      end
    end

    context "when a new user is not created" do
      it "returns http status success" do
        expect {
          post users_path({ "user": { "name":"", "age": "", "biography":"" } })
        }.not_to change {  User.count }
        expect(response).to have_http_status(:success)
      end
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
