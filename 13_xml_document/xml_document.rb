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

  def def method_missing(method, *args)
    main(args, method, ((block_given?)?yield: nil))
  end
  
end
#yield if block_given?
