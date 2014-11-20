require 'spec_helper'

describe "cconferences/show" do
  before(:each) do
    @cconference = assign(:cconference, stub_model(Cconference))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
