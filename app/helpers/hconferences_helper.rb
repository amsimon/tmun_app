module HconferencesHelper

  def confs
    Hconference.all
  end

  def conf_path(conf)
    tritonmun_path + "/" + (conf.roman)
  end

  def conf_button_path(button, conf)
    tritonmun_path + "/" + (conf.roman) + "/" + button
  end


  def spring_confs
    h = Hconference.all

    h.shift(2)

    h.delete_if do |conf|
      if conf.season != "Spring"
        true
      else
        false
      end
    end
    h
  end

  def fall_confs
    h = Hconference.all

    h.shift(2)

    h.delete_if do |conf|
      if conf.season != "Fall"
        true
      else
        false
      end
    end
    h
  end





end