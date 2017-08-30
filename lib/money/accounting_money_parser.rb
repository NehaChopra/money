class AccountingMoneyParser < DeprecatedMoneyParser
  class << self

    private

    def extract_money(input)
      # set () to mean negativity. ignore $
      super(input.gsub(/\(\$?(.*?)\)/, '-\1'))
    end
  end
end
