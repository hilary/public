class StringCalculator

  def Add(numbers)
    numbers.split(',').map{|x| x.to_i}.reduce(0, :+)
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

end
