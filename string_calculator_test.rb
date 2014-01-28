require 'minitest/autorun'
require './string_calculator.rb'

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

  describe 'a string with numbers separated by a mix of newlines and commas' do
    it 'returns the sum' do
      @calc.Add("2\n3,42\n1").must_equal 48
    end
  end

  describe 'a string with an optional default delimiter specification prefix' do

    it 'sets the delimiter when specified' do
      @calc.send('delim', "//;\n2;3;42\n1").must_equal ';'
    end

    it 'uses a comma otherwise' do
      @calc.send('delim', "2;3;42\n1").must_equal ','
    end

    it 'extracts the addends when a delimiter is specified' do
      @calc.send('addends', "//;\n2;3\n42;1").must_equal "2;3\n42;1"
    end

    it 'returns the addends unchanged otherwise' do
      @calc.send('addends', "2;3;42\n1").must_equal "2;3;42\n1"
    end

    it 'returns the sum' do
      @calc.Add("//;\n2;3;42\n1").must_equal 48
    end
  end

end
