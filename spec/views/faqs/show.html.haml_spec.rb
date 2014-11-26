require 'spec_helper'

describe "faqs/show" do
  before(:each) do
    @faq = assign(:faq, stub_model(Faq))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
