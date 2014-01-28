class StringCalculator

  def Add(numbers)
    clear_negative_addends
    sum = 0
    addends(numbers).split(/#{delim(numbers)}|\n/).each do |x| 
      begin
        if x == ""
          raise DelimiterError, 
                "input string had two delimiters in a row, e.g., 2,,3"
        else
          addend = x.to_i
          raise NegativeAddendError if addend < 0
          sum += addend
        end
      rescue NegativeAddendError
        record_negative_addend(x)
      end
    end
    if found_negative_addends? 
      raise NegativeAddendError, 
            "negatives not allowed, found: #{negative_addends}"
    else
      sum
    end
  end

  class Error < StandardError
  end

  class DelimiterError < Error
  end

  class NegativeAddendError < Error
  end

  private

    def addends(numbers)
      /(?:\A\/\/.\n)?(.*)/m.match(numbers)[1]
    end

    def delim(numbers)
      if m = /\A\/\/(.)\n/.match(numbers)
        m[1]
      else
        ','
      end
    end

    def clear_negative_addends
      @negative_addends = []
    end

    def record_negative_addend(x)
      @negative_addends << x
    end

    def found_negative_addends?
      @negative_addends.any?
    end

    def negative_addends
      @negative_addends
    end
end
