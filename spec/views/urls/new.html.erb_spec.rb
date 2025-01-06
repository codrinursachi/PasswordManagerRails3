require 'rails_helper'

RSpec.describe "urls/new", type: :view do
  before(:each) do
    assign(:url, Url.new(
      uri: "MyString",
      login: nil
    ))
  end

  it "renders new url form" do
    render

    assert_select "form[action=?][method=?]", urls_path, "post" do

      assert_select "input[name=?]", "url[uri]"

      assert_select "input[name=?]", "url[login_id]"
    end
  end
end
