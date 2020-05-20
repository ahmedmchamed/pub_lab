require('minitest/autorun')
require('minitest/reporters')
require_relative('../customer')
require_relative('../pub')
require_relative('../drink')
require_relative('../food')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestCustomer < MiniTest::Test

    def setup

        @drink1 = Drink.new("Hammer", 30, 1)
        @drink2 = Drink.new("TheDrill", 35, 2)
        @drink3 = Drink.new("Hacksaw", 40, 4)
        @drinks = [@drink1, @drink2, @drink3]

        @customer = Customer.new("Zack", 60, 39, 5)

        @pub = Pub.new("Chanter", 200, @drinks)

        @food = Food.new("Meatballs", 5, 2)
    
    end

    def test_customer_name()
        assert_equal("Zack", @customer.name())
    end

    def test_get_wallet_amount()
        assert_equal(60, @customer.get_wallet_amount())
    end

    def test_customer_can_buy_drink__enough_money()
        assert_equal(true, @customer.can_buy_drink(49))
    end

    def test_customer_can_buy_drink__not_enough_money()
        assert_equal(false, @customer.can_buy_drink(70))
    end

    def test_customer_eat_food()
        assert_equal(3, @customer.eat_food(@food))
    end

    def test_food_price_deducted()
        @customer.customer_buys_food(@food)
        assert_equal(55, @customer.get_wallet_amount())
    end

    def test_customer_drunkenness_goes_down_with_food()
        @customer.eat_food(@food)
        assert_equal(3, @customer.drunkenness())
    end

end