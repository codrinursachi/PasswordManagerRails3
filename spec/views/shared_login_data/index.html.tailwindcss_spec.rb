require 'rails_helper'

RSpec.describe "shared_login_data/index", type: :view do
  before(:each) do
    assign(:shared_login_data, [
      SharedLoginDatum.create!(
        login: nil,
        user: nil
      ),
      SharedLoginDatum.create!(
        login: nil,
        user: nil
      )
    ])
  end

  it "renders a list of shared_login_data" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
