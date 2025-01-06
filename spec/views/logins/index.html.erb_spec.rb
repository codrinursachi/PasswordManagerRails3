require 'rails_helper'

RSpec.describe "logins/index", type: :view do
  before(:each) do
    assign(:logins, [
      Login.create!(
        name: "Name",
        login_name: "Login Name",
        login_password: "Login Password",
        notes: "MyText",
        is_favorite: false,
        folder: nil
      ),
      Login.create!(
        name: "Name",
        login_name: "Login Name",
        login_password: "Login Password",
        notes: "MyText",
        is_favorite: false,
        folder: nil
      )
    ])
  end

  it "renders a list of logins" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Login Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Login Password".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
