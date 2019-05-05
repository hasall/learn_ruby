class XmlDocument
  def initialize(x = false)
    @n = x
  end
  def main(x, tag, y)
    if y!=nil
      str = y
      if @n
        str = ""
        ti = 0
        size = y.length
        while ti<size
          str += "  " if y[ti]=='<'
          str += y[ti]
          ti+=1
        end
      end
      ss = %(<#{tag}>#{(@n)?"\n":""}#{str}</#{tag}>#{(@n)?"\n":""})
      ss
    else
      str = ''
      if x != nil
        str = " "
        x.each{|k, v|
          str += k.to_s + "=\'" + v.to_s + "\'"
        }
      end
      %(<#{tag}#{str}/>#{(@n)?"\n":""})
    end
  end

  def hello(x = nil)
    main(x, "hello", ((block_given?)?yield: nil))
  end
  def goodbye(x = nil)
    main(x, "goodbye", ((block_given?)?yield: nil))
  end
  def come_back(x = nil)
    main(x, "come_back", ((block_given?)?yield: nil))
  end
  def ok_fine(x = nil)
    main(x, "ok_fine", ((block_given?)?yield: nil))
  end
  def send(tag, x = nil)
    main(x, tag, ((block_given?)?yield: nil))
  end
end
#yield if block_given?
