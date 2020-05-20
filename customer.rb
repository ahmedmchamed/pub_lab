class Customer

    attr_reader :name, :age, :drunkenness

    def initialize(name, wallet, age, drunkenness = 0)
       
        @name = name
        @wallet = wallet
        @age = age
        @drunkenness = drunkenness

    end

    def get_wallet_amount()
        return @wallet
    end

    def remove_drink_price_from_wallet(amount)
        @wallet -= amount
    end

    def increase_drunken_level(alcohol_amount)
        @drunkenness += alcohol_amount
    end

    def can_buy_drink(price)
        if get_wallet_amount() > price 
            return true
        else
            return false
        end
    end

end