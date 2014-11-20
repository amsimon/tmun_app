require 'spec_helper'

describe "cconferences/index" do
  before(:each) do
    assign(:cconferences, [
      stub_model(Cconference),
      stub_model(Cconference)
    ])
  end

  it "renders a list of cconferences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
