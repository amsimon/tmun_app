module FrontpagesHelper


  def left_slides
    l = Frontpage.where(side: 'left').to_a

    l
  end

  def right_slides
    r = Frontpage.where(side: 'right').to_a

    r
  end


end
