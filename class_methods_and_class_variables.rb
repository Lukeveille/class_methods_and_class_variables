class BankAccount
    # Class variables
    @@interest_rate = 1.0
    @@accounts = []

    # Class methods
    def self.create
        new_account = BankAccount.new
        @@accounts << new_account
        return new_account
    end

    def self.total_funds
        total = 0
        @@accounts.each do |account|
            total += account.balance
        end
        return total
    end

    def self.interest_time
        @@accounts.each do |account|
            account.balance *= ((@@interest_rate / 100) + 1)
        end
    end

    # Instance methods
    def initialize
        @balance = 0
    end

    def deposit(funds_to_deposit)
        @balance += funds_to_deposit
    end

    def withdraw(funds_to_withdraw)
        @balance -= funds_to_withdraw
    end

    # Attribute accessors
    attr_accessor :balance
end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0