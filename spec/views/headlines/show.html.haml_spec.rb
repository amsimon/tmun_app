require 'spec_helper'

describe "headlines/show" do
  before(:each) do
    @headline = assign(:headline, stub_model(Headline))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
