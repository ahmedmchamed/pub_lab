class Customer

    attr_reader :name, :age

    def initialize(name, wallet, age)
       
        @name = name
        @wallet = wallet
        @age = age

    end

    def get_wallet_amount()
        return @wallet
    end

    def remove_drink_price_from_wallet(amount)
        @wallet -= amount
    end

    # def can_buy_drink(pub, name_of_drink)
    #     for beverage in pub.return_list_of_drinks()
    #         if get_wallet_amount() > beverage.price()
    #             return true
    #         end
    #     end
    #     return false
    # end

    def can_buy_drink(price)
        if get_wallet_amount() > price 
            return true
        else
            return false
        end
    end

end