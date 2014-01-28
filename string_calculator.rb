class StringCalculator

  # Was not sure if it was supposed to detect and positively reject invalid 
  # formats, so the code does. In general, would not do so.
  def Add(numbers)
    addends = numbers.split(/,|\n/).map do |x| 
      if x == ""
        raise "Invalid format"
      else
        x.to_i
      end
    end
    addends.reduce(0, :+)
  end

end

require 'minitest/autorun'

class TestStringCalculator < Minitest::Spec

  before do
    @calc = StringCalculator.new
  end

  describe 'an empty string' do
    it 'returns 0' do
      @calc.Add("").must_equal 0
    end
  end

  describe 'a string with one number' do
    it 'returns the number' do
      @calc.Add("0").must_equal 0
    end

    it 'returns the number' do
      @calc.Add("42").must_equal 42
    end
  end

  describe 'a string with two numbers separated by a comma' do
    it 'returns the sum' do
      @calc.Add("210,12").must_equal 222
    end
  end

  describe 'a string with many numbers separated by commas' do
    it 'returns the sum' do
      @calc.Add("2,3,42,1").must_equal 48
    end
  end

  describe 'a string with numbers separated by newlines' do
    it 'returns the sum' do
      @calc.Add("2\n3,42,1").must_equal 48
    end
  end

end
