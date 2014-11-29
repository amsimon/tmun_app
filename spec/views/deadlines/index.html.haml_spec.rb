require 'spec_helper'

describe "deadlines/index" do
  before(:each) do
    assign(:deadlines, [
      stub_model(Deadline),
      stub_model(Deadline)
    ])
  end

  it "renders a list of deadlines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
