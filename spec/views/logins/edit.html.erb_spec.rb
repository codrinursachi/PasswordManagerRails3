require 'rails_helper'

RSpec.describe "logins/edit", type: :view do
  let(:login) {
    Login.create!(
      name: "MyString",
      login_name: "MyString",
      login_password: "MyString",
      notes: "MyText",
      is_favorite: false,
      folder: nil
    )
  }

  before(:each) do
    assign(:login, login)
  end

  it "renders the edit login form" do
    render

    assert_select "form[action=?][method=?]", login_path(login), "post" do

      assert_select "input[name=?]", "login[name]"

      assert_select "input[name=?]", "login[login_name]"

      assert_select "input[name=?]", "login[login_password]"

      assert_select "textarea[name=?]", "login[notes]"

      assert_select "input[name=?]", "login[is_favorite]"

      assert_select "input[name=?]", "login[folder_id]"
    end
  end
end
