require 'spec_helper'

describe "tconferences/edit" do
  before(:each) do
    @tconference = assign(:tconference, stub_model(Tconference))
  end

  it "renders the edit tconference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tconference_path(@tconference), "post" do
    end
  end
end
