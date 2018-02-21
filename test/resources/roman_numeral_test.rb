# frozen_string_literal: true

require File.dirname(__FILE__) + '/../test_helper'
require_relative '../../app/resources/roman_numeral'

class RomanNumeralTest < ActiveSupport::TestCase

  test '#to_s numeral == 4' do
    roman_numeral = RomanNumeral.new(numeral: 4)
    assert { roman_numeral.to_s == 'ⅠⅤ' }
  end

  test '#to_s numeral == 5' do
    roman_numeral = RomanNumeral.new(numeral: 5)
    assert { roman_numeral.to_s == 'Ⅴ' }
  end

  test '#to_s numeral == 9' do
    roman_numeral = RomanNumeral.new(numeral: 9)
    assert { roman_numeral.to_s == 'ⅠⅩ' }
  end

  test '#to_s numeral == 10' do
    roman_numeral = RomanNumeral.new(numeral: 10)
    assert { roman_numeral.to_s == 'Ⅹ' }
  end

  test '#to_s numeral == 49' do
    roman_numeral = RomanNumeral.new(numeral: 49)
    assert { roman_numeral.to_s == 'ⅠⅬ' }
  end

  test '#to_s numeral == 50' do
    roman_numeral = RomanNumeral.new(numeral: 50)
    assert { roman_numeral.to_s == 'Ⅼ' }
  end

  test '#to_s numeral == 99' do
    roman_numeral = RomanNumeral.new(numeral: 99)
    assert { roman_numeral.to_s == 'ⅩⅭⅠⅩ' }
  end

  test '#to_s numeral == 100' do
    roman_numeral = RomanNumeral.new(numeral: 100)
    assert { roman_numeral.to_s == 'Ⅽ' }
  end

  test '#to_s numeral == 499' do
    roman_numeral = RomanNumeral.new(numeral: 499)
    assert { roman_numeral.to_s == 'ⅠⅮ' }
  end

  test '#to_s numeral == 500' do
    roman_numeral = RomanNumeral.new(numeral: 500)
    assert { roman_numeral.to_s == 'Ⅾ' }
  end

  test '#to_s numeral == 999' do
    roman_numeral = RomanNumeral.new(numeral: 999)
    assert { roman_numeral.to_s == 'ⅠⅯ' }
  end

  test '#to_s numeral == 1000' do
    roman_numeral = RomanNumeral.new(numeral: 1000)
    assert { roman_numeral.to_s == 'Ⅿ' }
  end

  test '#to_s numeral == 12' do
    roman_numeral = RomanNumeral.new(numeral: 12)
    assert { roman_numeral.to_s == 'ⅩⅠⅠ' }
  end

  test '式展開' do
    roman_numeral = RomanNumeral.new(numeral: 24)
    assert { "#{roman_numeral}" == 'ⅩⅩⅠⅤ' }
  end

  test '#+' do
    roman_numeral1 = RomanNumeral.new(numeral: 12)
    roman_numeral2 = RomanNumeral.new(numeral: 12)
    assert { "#{roman_numeral1 + roman_numeral2}" == 'ⅩⅩⅠⅤ' }
  end

  test '#*' do
    roman_numeral1 = RomanNumeral.new(numeral: 2)
    roman_numeral2 = RomanNumeral.new(numeral: 2)
    assert { "#{roman_numeral1 * roman_numeral2}" == 'ⅠV' }
  end
end
