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

RSpec.describe "/urls", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Url. As you add validations to Url, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Url.create! valid_attributes
      get urls_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      url = Url.create! valid_attributes
      get url_url(url)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_url_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      url = Url.create! valid_attributes
      get edit_url_url(url)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Url" do
        expect {
          post urls_url, params: { url: valid_attributes }
        }.to change(Url, :count).by(1)
      end

      it "redirects to the created url" do
        post urls_url, params: { url: valid_attributes }
        expect(response).to redirect_to(url_url(Url.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Url" do
        expect {
          post urls_url, params: { url: invalid_attributes }
        }.to change(Url, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post urls_url, params: { url: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested url" do
        url = Url.create! valid_attributes
        patch url_url(url), params: { url: new_attributes }
        url.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the url" do
        url = Url.create! valid_attributes
        patch url_url(url), params: { url: new_attributes }
        url.reload
        expect(response).to redirect_to(url_url(url))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        url = Url.create! valid_attributes
        patch url_url(url), params: { url: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested url" do
      url = Url.create! valid_attributes
      expect {
        delete url_url(url)
      }.to change(Url, :count).by(-1)
    end

    it "redirects to the urls list" do
      url = Url.create! valid_attributes
      delete url_url(url)
      expect(response).to redirect_to(urls_url)
    end
  end
end
