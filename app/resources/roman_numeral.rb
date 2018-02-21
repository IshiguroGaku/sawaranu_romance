# frozen_string_literal: true

module Types
  include Dry::Types.module
end

class RomanNumeral < Dry::Struct
  class RomanNumeralRangeError < StandardError ; end

  ROMAN_DICTIONARY = {
    1 => 'Ⅰ',
    5 => 'Ⅴ',
    10 => 'Ⅹ',
    50 => 'Ⅼ',
    100 => 'Ⅽ',
    500 => 'Ⅾ',
    1000 => 'Ⅿ'
  }

  attribute :numeral, Types::Coercible::Int

  def to_s
    to_roman_numeric
  end

  def +(val)
    RomanNumeral.new(numeral: numeral + val.numeral)
  end

  def *(val)
    RomanNumeral.new(numeral: numeral * val.numeral)
  end

  private

  def to_roman_numeric
    str = ''
    tmp_num = numeral
    ROMAN_DICTIONARY.keys.reverse.each do |num|
      q, mod = tmp_num.divmod num

      if q <= 3
        str += ROMAN_DICTIONARY[num] * q
      elsif q >= 4
        str += "#{ROMAN_DICTIONARY[num]}#{ROMAN_DICTIONARY[num * 5]}"
      end

      mod2 = mod % (num - (num / 10))
      if mod != mod2
        str += "#{ROMAN_DICTIONARY[num / 10]}#{ROMAN_DICTIONARY[num]}"
        mod = mod2
      end

      tmp_num = mod

      break if tmp_num == 0
    end

    str
  end
end
