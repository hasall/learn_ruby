def translate(s)
  temp = ["a", "e", "y", "i", "o"]
  str = String.new
  smas = s.split
  i=0
  size = smas.length
  while i<size
    if temp.include? smas[i][0]
      smas[i]+="ay"
    else
      size_smas = smas[i].length
      k = 0
      while !(temp.include? smas[i][k])
        t= smas[i][k]
        smas[i] = smas[i].byteslice(1, smas[i].length)
        smas[i]+= t
      end
      smas[i]+= "ay"
    end
    str +=" " + smas[i]
    i+=1
  end
  str.byteslice(1, str.length)
end
