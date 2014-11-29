require 'spec_helper'

describe "deadlines/new" do
  before(:each) do
    assign(:deadline, stub_model(Deadline).as_new_record)
  end

  it "renders new deadline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deadlines_path, "post" do
    end
  end
end
