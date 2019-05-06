class Temperature

  def initialize(x)
    @c = x[:c]          if x[:c] != nil
    @c = (x[:f]-32)/1.8 if x[:f] != nil
    @c = 0              if x[:f] == nil && x[:c] == nil
  end
  def self.from_celsius(x = 0)
    new(:c=>x)
  end
  def self.from_fahrenheit(x = 0)
    new(:f=>x)
  end
  def in_fahrenheit
    i = ((@c*1.8)+32)
    (i.to_int == i.round(1))? i.to_int: i.round(1)
  end

  def in_celsius
    @c
  end
end

class Fahrenheit
  def self.new(x)
    t = Temperature.new(:f=>x)
    t
  end
end
class Celsius
  def self.new(x)
    t = Temperature.new(:c=>x)
    t
  end
end
