class RPNCalculator
  def initialize
    @token = []
    @mas = [:+, :-, :/, :*]
  end

  def push( x )
    @token[@token.size] = x.to_f
  end

  def plus
    raise "calculator is empty" if @token.empty?
    @token[@token.size] = :+
  end

  def minus
    raise "calculator is empty" if @token.empty?
    @token[@token.size] = :-
  end

  def times
    raise "calculator is empty" if @token.empty?
    @token[@token.size] = :*
  end

  def divide
    raise "calculator is empty" if @token.empty?
    @token[@token.size] = :/
  end

  def value(x = nil)
    temp = x
    temp = @token if x == nil
    result = nil
    bool = false
    @mas.each{
      |v|
      bool = true if temp.include? v
    }
    while bool
      i = 0
      size = @token.length
      while i < size
        if @mas.include? temp[i]
          case temp[i]
          when :+
            result = temp[i-2].to_f + temp[i-1].to_f
          when :-
            result = temp[i-2].to_f - temp[i-1].to_f
          when :*
            result = temp[i-2].to_f * temp[i-1].to_f
          when :/
            result = temp[i-2].to_f / temp[i-1].to_f
          end
          temp.delete_at(i)
          temp.delete_at(i-1)
          temp[i-2] = result
          break
        end
        i += 1
      end
      bool = false
      @mas.each{
        |v|
        bool = true if temp.include? v
      }
    end
    temp.last
  end

  def evaluate(x)
    @token = tokens(x)
    value.to_f
  end

  def tokens(x)
    temp = []
    x = x.split
    x.each {
      |v|
      if @mas.include? v.to_sym
        temp[temp.size] = v.to_sym
      else
        temp[temp.size] = v.to_i
      end
    }
    temp
  end
end
