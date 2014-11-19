require 'spec_helper'

describe "tconferences/index" do
  before(:each) do
    assign(:tconferences, [
      stub_model(Tconference),
      stub_model(Tconference)
    ])
  end

  it "renders a list of tconferences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
