Array.class_eval do
  def sum
    s = 0
    self.each{ |v|
      s += v
    }
    s
  end
  def square
    m = []
    i = 0
    self.each{ |v|
      m[i] = v*v
      i+=1
    }
    m
  end
  def square!
    i = 0
    self.each{ |v|
      self[i] = v*v
      i+=1
    }
    self
  end
end
