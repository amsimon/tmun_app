require 'spec_helper'

describe "headlines/new" do
  before(:each) do
    assign(:headline, stub_model(Headline).as_new_record)
  end

  it "renders new headline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", headlines_path, "post" do
    end
  end
end
