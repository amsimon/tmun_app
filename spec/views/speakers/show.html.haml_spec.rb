require 'spec_helper'

describe "speakers/show" do
  before(:each) do
    @speaker = assign(:speaker, stub_model(Speaker,
      :portrait_url => "MyText",
      :name => "MyText",
      :committee_name => "MyText",
      :bio => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
