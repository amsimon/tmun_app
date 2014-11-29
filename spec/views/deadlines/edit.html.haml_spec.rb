require 'spec_helper'

describe "deadlines/edit" do
  before(:each) do
    @deadline = assign(:deadline, stub_model(Deadline))
  end

  it "renders the edit deadline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deadline_path(@deadline), "post" do
    end
  end
end
