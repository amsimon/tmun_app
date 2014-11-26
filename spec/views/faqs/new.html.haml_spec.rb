require 'spec_helper'

describe "faqs/new" do
  before(:each) do
    assign(:faq, stub_model(Faq).as_new_record)
  end

  it "renders new faq form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", faqs_path, "post" do
    end
  end
end
