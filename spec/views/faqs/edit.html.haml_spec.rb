require 'spec_helper'

describe "faqs/edit" do
  before(:each) do
    @faq = assign(:faq, stub_model(Faq))
  end

  it "renders the edit faq form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", faq_path(@faq), "post" do
    end
  end
end
