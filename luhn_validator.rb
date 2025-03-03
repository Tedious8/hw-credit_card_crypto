# frozen_string_literal: true

# This module implements the Luhn algorithm for validating credit card numbers.
# It checks whether a given card number has a valid checksum.
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    parity = nums_a.length % 2
    check_digit = nums_a.pop
    sum = (10 - (nums_a.each_with_index.sum { |digit, index| computing_check_digit(digit, index, parity) } % 10)) % 10
    sum == check_digit
  end

  private

  def computing_check_digit(digit, index, parity)
    return digit if index % 2 != parity

    return 2 * digit - 9 if digit > 4

    2 * digit
  end
end
