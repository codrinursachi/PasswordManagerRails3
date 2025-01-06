require 'rails_helper'

RSpec.describe "folders/index", type: :view do
  before(:each) do
    assign(:folders, [
      Folder.create!(
        name: "Name",
        user: nil
      ),
      Folder.create!(
        name: "Name",
        user: nil
      )
    ])
  end

  it "renders a list of folders" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
