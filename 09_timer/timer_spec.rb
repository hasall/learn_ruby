# # Topics
#
# * classes
# * instance variables
# * string formats
# * modular arithmetic
#
# # Timer

#require 'timer'
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


describe "Timer" do
  before(:each) do
    @timer = Timer.new
  end

  it "should initialize to 0 seconds" do
    expect(@timer.seconds).to eql( 0.0)
  end

  describe 'time_string' do
    it "should display 0 seconds as 00:00:00" do
      @timer.seconds = 0
      expect(@timer.time_string).to eql("00:00:00")
    end

    it "should display 12 seconds as 00:00:12" do
      @timer.seconds = 12
      expect(@timer.time_string).to eql( "00:00:12")
    end

    it "should display 66 seconds as 00:01:06" do
      @timer.seconds = 66
      expect(@timer.time_string).to eql( "00:01:06")
    end

    it "should display 4000 seconds as 01:06:40" do
      @timer.seconds = 4000
      expect( @timer.time_string).to eql( "01:06:40")
    end
  end


  # One way to implement the Timer is with a helper method.
  # Uncomment these specs if you want to test-drive that
  # method, then call that method from inside of time_string.
  #
  describe 'padded' do
    it 'pads zero' do
      @timer.padded(0).should == '00'
    end
    it 'pads one' do
      @timer.padded(1).should == '01'
    end
    it "doesn't pad a two-digit number" do
      @timer.padded(12).should == '12'
    end
  end
end
