require 'main'

describe("kata") do

  let(:account_input) { File.read("spec/assets/account_123456789") }
  let(:multiple_accounts_input) { File.read("spec/assets/multiple_accounts") }
  let(:token_one) { "   \n  |\n  |\n   " }
  let(:token_two) { " _ \n _|\n|_ \n   " }

  describe "#tokenizer" do
    it "returns the first token" do
      actual_first = tokenizer(account_input).first

      expect(actual_first).to eql token_one
    end

    it "returns the second token" do
      actual_second = tokenizer(account_input)[1]

      expect(actual_second).to eql token_two
    end

    it "returns the last token" do
      expected_last = " _ \n|_|\n _|\n   "

      actual_last = tokenizer(account_input).last

      expect(actual_last).to eql expected_last
    end

  end

  describe "#token_to_digit" do
    it "understands one and two" do
      actual_one = token_to_digit(token_one)
      actual_two = token_to_digit(token_two)

      expect(actual_one).to eql 1
      expect(actual_two).to eql 2
    end

  end

  describe "#parse_account" do
    it "parses the full account line" do
      expected_account = "123456789"

      actual_account = parse_account(account_input)

      expect(actual_account).to eql(expected_account)
    end
  end

  describe "#parse_accounts" do
    it "parses an input with multiple accounts" do
      expected_accounts = [
        "123456789",
        "812345796",
        "126345709"
      ]

      actual_accounts = parse_accounts(multiple_accounts_input)

      expect(actual_accounts).to eql(expected_accounts)

    end
  end
end
