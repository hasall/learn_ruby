class Timer

  def initialize(sec = 0.0)
    @seconds = sec
  end
  def seconds
    @seconds
  end
  def seconds=(value)
    @seconds = value
  end
  def padded(x)
    ((x<10)? ("0"+x.to_s):x.to_s)
  end
  def time_string
    sec = @seconds
    hh = 0
    mm = 0
    while sec > 3600
      sec -= 3600
      hh += 1
    end
    while sec > 60
      sec -= 60
      mm += 1
    end
    str = ((hh<10)? ("0"+hh.to_s):hh.to_s) + ":"
    str +=((mm<10)? ("0"+mm.to_s):mm.to_s) + ":"
    str +=(sec<10)? ("0"+sec.to_i.to_s):sec.to_s
    str
  end
end
