require 'spec_helper'

describe "speakers/index" do
  before(:each) do
    assign(:speakers, [
      stub_model(Speaker,
        :portrait_url => "MyText",
        :name => "MyText",
        :committee_name => "MyText",
        :bio => "MyText"
      ),
      stub_model(Speaker,
        :portrait_url => "MyText",
        :name => "MyText",
        :committee_name => "MyText",
        :bio => "MyText"
      )
    ])
  end

  it "renders a list of speakers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
