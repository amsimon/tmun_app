require 'spec_helper'

describe "headlines/index" do
  before(:each) do
    assign(:headlines, [
      stub_model(Headline),
      stub_model(Headline)
    ])
  end

  it "renders a list of headlines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
