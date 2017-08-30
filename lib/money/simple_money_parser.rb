# Parses amounts with optionally a space and currency code. Raises an error if
# it is unable to parse. Intended for use in APIs where you can expect well
# formed input.

class SimpleMoneyParser
  ParseError = Class.new(StandardError)

  class << self
    def parse(input)
      input = input.to_s
      amount, currency = input.scan(/^(-?\d*\.?\d*)(?: ([A-Z]{3}))?/).first

      if amount.empty?
        raise ParseError, "empty amount: #{input[0,32]}"
      else
        Money.new(amount, currency)
      end
    end
  end
end
