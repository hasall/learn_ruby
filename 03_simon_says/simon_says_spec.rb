# # Simon Says
#
# ## Topics
#
# * functions
# * strings
# * default parameter values
#
# ## Hints
#
# When you make the second `repeat` test pass, you might break the **first**
#

#require "simon_says"
def echo(s)
  s
end

def shout(s)
  s.upcase
end

def repeat(s, i = 2)
  str = s
  i-=1
  i.times {
    str += " " + s.to_s
  }
  str
end

def start_of_word(s, i)
  s.byteslice(0, i)
end

def first_word(s)
  s.split[0]
end

def titleize(s)
  str = String.new
  smas = s.split
  str+= smas[0].capitalize
  i = 1
  size = smas.length
  while i < size do
    if smas[i].length > 4 || i == size - 1
      str += " " + smas[i].capitalize
    else
      str += " " + smas[i]
    end
    i+=1
  end
  str
end


describe "Simon says" do
  describe "echo" do
    it "should echo hello" do
      expect(echo("hello")).to eq( "hello")
    end

    it "should echo bye" do
      expect( echo("bye")).to eq( "bye")
    end
  end

  describe "shout" do
    it "should shout hello" do
      expect(shout("hello")).to eq("HELLO")
    end

    it "should shout multiple words" do
      expect(shout("hello world")).to eq( "HELLO WORLD")
    end
  end

  describe "repeat" do
    it "should repeat" do
      expect( repeat("hello")).to eq( "hello hello")
    end

    # Wait a second! How can you make the "repeat" method
    # take one *or* two arguments?
    #
    # Hint: *default values*
    it "should repeat a number of times" do
      repeat("hello", 3).should == "hello hello hello"
    end
  end

  describe "start_of_word" do
    it "returns the first letter" do
      start_of_word("hello", 1).should == "h"
    end

    it "returns the first two letters" do
      start_of_word("Bob", 2).should == "Bo"
    end

    it "returns the first several letters" do
      s = "abcdefg"
      start_of_word(s, 1).should == "a"
      start_of_word(s, 2).should == "ab"
      start_of_word(s, 3).should == "abc"
    end
  end

  describe "first_word" do
    it "tells us the first word of 'Hello World' is 'Hello'" do
      first_word("Hello World").should == "Hello"
    end

    it "tells us the first word of 'oh dear' is 'oh'" do
      first_word("oh dear").should == "oh"
    end
  end

  describe "titleize" do
    it "capitalizes a word" do
      titleize("jaws").should == "Jaws"
    end

    it "capitalizes every word (aka title case)" do
      titleize("david copperfield").should == "David Copperfield"
    end

    it "doesn't capitalize 'little words' in a title" do
      titleize("war and peace").should == "War and Peace"
    end

    it "does capitalize 'little words' at the start of a title" do
      titleize("the bridge over the river kwai").should == "The Bridge over the River Kwai"
    end
  end

end
