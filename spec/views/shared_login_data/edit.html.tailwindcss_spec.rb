require 'rails_helper'

RSpec.describe "shared_login_data/edit", type: :view do
  let(:shared_login_datum) {
    SharedLoginDatum.create!(
      login: nil,
      user: nil
    )
  }

  before(:each) do
    assign(:shared_login_datum, shared_login_datum)
  end

  it "renders the edit shared_login_datum form" do
    render

    assert_select "form[action=?][method=?]", shared_login_datum_path(shared_login_datum), "post" do
      assert_select "input[name=?]", "shared_login_datum[login_id]"

      assert_select "input[name=?]", "shared_login_datum[user_id]"
    end
  end
end
