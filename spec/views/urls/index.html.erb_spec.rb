require 'rails_helper'

RSpec.describe "urls/index", type: :view do
  before(:each) do
    assign(:urls, [
      Url.create!(
        uri: "Uri",
        login: nil
      ),
      Url.create!(
        uri: "Uri",
        login: nil
      )
    ])
  end

  it "renders a list of urls" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Uri".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
