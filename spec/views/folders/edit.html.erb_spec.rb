require 'rails_helper'

RSpec.describe "folders/edit", type: :view do
  let(:folder) {
    Folder.create!(
      name: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:folder, folder)
  end

  it "renders the edit folder form" do
    render

    assert_select "form[action=?][method=?]", folder_path(folder), "post" do

      assert_select "input[name=?]", "folder[name]"

      assert_select "input[name=?]", "folder[user_id]"
    end
  end
end
