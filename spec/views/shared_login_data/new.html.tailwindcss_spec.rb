require 'rails_helper'

RSpec.describe "shared_login_data/new", type: :view do
  before(:each) do
    assign(:shared_login_datum, SharedLoginDatum.new(
      login: nil,
      user: nil
    ))
  end

  it "renders new shared_login_datum form" do
    render

    assert_select "form[action=?][method=?]", shared_login_data_path, "post" do
      assert_select "input[name=?]", "shared_login_datum[login_id]"

      assert_select "input[name=?]", "shared_login_datum[user_id]"
    end
  end
end
