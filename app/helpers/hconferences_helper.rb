module HconferencesHelper

  def conf_path(conf)
    tritonmun_path + "/" + (conf.number).to_s
  end

  def conf_button_path(button, conf)
    tritonmun_path + "/" + (conf.number).to_s + "/" + button
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


  def to_roman(hconference)
    result = ""
    number = hconference.number
    roman_mapping.keys.each do |divisor|
      quotient, modulus = number.divmod(divisor)
      result << roman_mapping[divisor] * quotient
      number = modulus
    end
    result
  end

  private

  def roman_mapping
    {
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
    }
  end


end