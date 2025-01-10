require 'rails_helper'

RSpec.describe "logins/new", type: :view do
  before(:each) do
    assign(:login, Login.new(
      name: "MyString",
      login_name: "MyString",
      login_password: "MyString",
      notes: "MyText",
      is_favorite: false,
      folder: nil
    ))
  end

  it "renders new login form" do
    render

    assert_select "form[action=?][method=?]", logins_path, "post" do
      assert_select "input[name=?]", "login[name]"

      assert_select "input[name=?]", "login[login_name]"

      assert_select "input[name=?]", "login[login_password]"

      assert_select "textarea[name=?]", "login[notes]"

      assert_select "input[name=?]", "login[is_favorite]"

      assert_select "input[name=?]", "login[folder_id]"
    end
  end
end
