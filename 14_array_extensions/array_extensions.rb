Array.class_eval do
  def sum
    s = self.inject(&:+)
    (s==nil)?0:s
  end
  def square
    m = []
    i = 0
    self.map{ |v|
      v*v
    }
  end
  def square!
    i = 0
    self.map!{ |v|
      v*v
    }
  end
end
