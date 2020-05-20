class Pub

    attr_reader :name, :till

    def initialize(name, till, drinks = [])
        @name = name
        @till = till
        @drinks = drinks
    end

    def number_of_drinks()
        return @drinks.size()
    end

    def return_list_of_drinks()
        return @drinks
    end

    def remove_drink(drink)
        @drinks.delete(drink)
    end

    def add_to_till(amount)
        @till += amount
    end

    def sell_drink_to_customer(drink, customer)
        drinks_menu = return_list_of_drinks()
        age_limit = 18

        return if customer.age() < age_limit

        for beverage in drinks_menu
            if beverage.name() == drink && customer.can_buy_drink(beverage.price())
                remove_drink(beverage)
                customer.remove_drink_price_from_wallet(beverage.price())
                add_to_till(beverage.price())
            end
        end
    end

end