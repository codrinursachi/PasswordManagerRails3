require 'rails_helper'

RSpec.describe "logins/show", type: :view do
  before(:each) do
    assign(:login, Login.create!(
      name: "Name",
      login_name: "Login Name",
      login_password: "Login Password",
      notes: "MyText",
      is_favorite: false,
      folder: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Login Name/)
    expect(rendered).to match(/Login Password/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
