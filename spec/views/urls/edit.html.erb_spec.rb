require 'rails_helper'

RSpec.describe "urls/edit", type: :view do
  let(:url) {
    Url.create!(
      uri: "MyString",
      login: nil
    )
  }

  before(:each) do
    assign(:url, url)
  end

  it "renders the edit url form" do
    render

    assert_select "form[action=?][method=?]", url_path(url), "post" do

      assert_select "input[name=?]", "url[uri]"

      assert_select "input[name=?]", "url[login_id]"
    end
  end
end
