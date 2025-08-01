module SavingsAccount
  def self.interest_rate(balance)
    if balance.negative?
      3.213
    elsif balance < 1000
      0.5
    elsif balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    balance + balance * interest_rate(balance) * 0.01
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    now_balance = current_balance
    years = 0
    while now_balance < desired_balance
      years += 1
      now_balance = annual_balance_update(now_balance)
    end
    years
  end
end
