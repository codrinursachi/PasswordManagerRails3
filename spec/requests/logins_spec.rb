require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/logins", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Login. As you add validations to Login, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Login.create! valid_attributes
      get logins_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      login = Login.create! valid_attributes
      get login_url(login)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_login_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      login = Login.create! valid_attributes
      get edit_login_url(login)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Login" do
        expect {
          post logins_url, params: { login: valid_attributes }
        }.to change(Login, :count).by(1)
      end

      it "redirects to the created login" do
        post logins_url, params: { login: valid_attributes }
        expect(response).to redirect_to(login_url(Login.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Login" do
        expect {
          post logins_url, params: { login: invalid_attributes }
        }.to change(Login, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post logins_url, params: { login: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested login" do
        login = Login.create! valid_attributes
        patch login_url(login), params: { login: new_attributes }
        login.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the login" do
        login = Login.create! valid_attributes
        patch login_url(login), params: { login: new_attributes }
        login.reload
        expect(response).to redirect_to(login_url(login))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        login = Login.create! valid_attributes
        patch login_url(login), params: { login: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested login" do
      login = Login.create! valid_attributes
      expect {
        delete login_url(login)
      }.to change(Login, :count).by(-1)
    end

    it "redirects to the logins list" do
      login = Login.create! valid_attributes
      delete login_url(login)
      expect(response).to redirect_to(logins_url)
    end
  end
end
