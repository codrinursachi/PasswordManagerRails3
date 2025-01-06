require 'rails_helper'

RSpec.describe "urls/show", type: :view do
  before(:each) do
    assign(:url, Url.create!(
      uri: "Uri",
      login: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uri/)
    expect(rendered).to match(//)
  end
end
