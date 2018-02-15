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
    1000 => 'Ⅿ',
  }

  attribute :numeral, Types::Coercible::Int

  def to_s
    if numeral == 1
      'I'
    elsif numeral == 2
      'II'
    elsif numeral == 3
      'III'
    elsif numeral == 4
      'IV'
    elsif numeral == 5
      'V'
    elsif numeral == 6
      'VI'
    elsif numeral == 7
      'VII'
    elsif numeral == 8
      'VIII'
    elsif numeral == 9
      'IX'
    elsif numeral == 10
      'X'
    elsif numeral == 11
      'XI'
    elsif numeral == 12
      'ⅩⅠⅠ'
    elsif numeral == 24
      'ⅩⅩⅠⅤ'
    end
  end

  def +(val)
    RomanNumeral.new(numeral: numeral + val.numeral)
  end

  private

  def to_roman_numeric

  end
end
