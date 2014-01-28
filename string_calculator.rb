class StringCalculator

  def Add(numbers)
    addends(numbers).split(/#{delim(numbers)}|\n/).inject(0) do |sum, x| 
      if x == ""
        raise "input string had two delimiters in a row, e.g., 2,,3"
      else
        sum + x.to_i
      end
    end
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

end
