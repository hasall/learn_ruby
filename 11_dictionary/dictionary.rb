class Dictionary
  def initialize
    @hash = {}
  end

  def entries
    @hash
  end

  def find( x )
    ss = {}
    @hash.each_pair{
      |k, v|
      ss[k] = v if k.include? x
    }
    ss
  end
  def include?(x)
    @hash.has_key? x
  end

  def add(x)
    if Hash.try_convert(x) != nil
      @hash.merge!(x)
    else
      @hash[x] = nil
    end
    @hash = @hash.sort.to_h
  end

  def printable
    str = ""
    @hash.each_pair{
      |k, v|
      str+="[#{k}] \"#{v}\"\n"
    }
    str[0..str.length-2]
  end

  def keywords
    @hash.keys
  end
end
