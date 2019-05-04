class Dictionary
  def initialize
    @mas = {}
  end

  def entries
    @mas
  end

  def find( x )
    ss = {}
    @mas.each_pair{
      |k, v|
      if k.include? x
        ss[k] = v
      end
    }
    ss
  end
  def include?(x)
    t=false
    @mas.each_pair{
      |k, v|
      if k==x
        t = true
      end
    }
    if t
      true
    else
      false
    end
  end

  def add(x)
    if Hash.try_convert(x) != nil
      x.each_pair{
        |k, v|
        @mas[k] = v
      }
    else
      @mas[x] = nil
    end
    @mas = @mas.sort.to_h
  end

  def printable
    str = String.new
    @mas.each_pair{
      |k, v|
      str+="[#{k}] \"#{v}\"\n"
    }
    str.byteslice(0, str.length-1)
  end

  def keywords
    @mas.keys
  end
end
