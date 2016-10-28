def take_token(account_input, offset)
  lines = account_input.split("\n")

  first_char = lines.map do |line|
    line.chars[offset .. offset + 2].join("")
  end

  first_char.join("\n")
end

def tokenizer(account_input)
  0.upto(8).map do |offset|
    take_token(account_input, offset * 3)
  end
end

def token_to_digit(token)
  translations = {
    " _ \n| |\n|_|\n   " => 0,
    "   \n  |\n  |\n   " => 1,
    " _ \n _|\n|_ \n   " => 2,
    " _ \n _|\n _|\n   " => 3,
    "   \n|_|\n  |\n   " => 4,
    " _ \n|_ \n _|\n   " => 5,
    " _ \n|_ \n|_|\n   " => 6,
    " _ \n  |\n  |\n   " => 7,
    " _ \n|_|\n|_|\n   " => 8,
    " _ \n|_|\n _|\n   " => 9
  }

  translations[token]
end

def parse_account(account_input)
  tokens = tokenizer(account_input)

  digits = tokens.map { |token| token_to_digit(token) }

  digits.join("")
end

def parse_accounts(accounts_input)
  accounts_input.lines.each_slice(4).map do |account_input|
    parse_account(account_input.join(""))
  end
end

