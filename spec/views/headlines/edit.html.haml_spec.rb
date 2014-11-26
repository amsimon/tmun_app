require 'spec_helper'

describe "headlines/edit" do
  before(:each) do
    @headline = assign(:headline, stub_model(Headline))
  end

  it "renders the edit headline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", headline_path(@headline), "post" do
    end
  end
end
