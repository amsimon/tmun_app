require 'spec_helper'

describe "tconferences/show" do
  before(:each) do
    @tconference = assign(:tconference, stub_model(Tconference))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
