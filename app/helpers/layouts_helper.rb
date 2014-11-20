module LayoutsHelper
  def parent_layout(layout, &blk)
    render({ layout: "layouts/#{layout}" }, &blk)
  end
end