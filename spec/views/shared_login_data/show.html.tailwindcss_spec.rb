require 'rails_helper'

RSpec.describe "shared_login_data/show", type: :view do
  before(:each) do
    assign(:shared_login_datum, SharedLoginDatum.create!(
      login: nil,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
