
Integer.class_eval do
  def in_words
    mas_n =  ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
    mas_2n = ['00', '10', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
    mas_3n = ['', ' thousand', ' million', ' billion', ' trillion']
    num = self.to_s
    num = "0" + num if num.length%3==2
    num = "00"+ num if num.length%3==1
    str = ""
    while num!=""
      bool = true
      bool2 = false
      if num[0] != "0"
        bool2 = true
        str +=" "+ mas_n[num[0].to_i] + " hundred"
      end
      if num[1] == "1"
        bool2 = true
        bool = false
        temp = num[1] + num[2]
        str +=" "+ mas_n[temp.to_i]
      end
      if num[1] != "0" && num[1] != "1"
        bool2 = true
        str +=" "+ mas_2n[num[1].to_i]
      end
      if bool
        if num[2] != "0"
          bool2 = true
          str +=" "+ mas_n[num[2].to_i]
        end
        if num[2] == "0" && str == ""
          bool2 = true
          str +=" "+ mas_n[num[2].to_i]
        end
      end
      num = num.byteslice(3, num.length)

      size = num.length/3

      str += mas_3n[size] if bool2
    end

    str.byteslice(1, str.length)
  end
end
