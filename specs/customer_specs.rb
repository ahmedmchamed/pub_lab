require('minitest/autorun')
require('minitest/reporters')
require_relative('../customer')
require_relative('../pub')
require_relative('../drink')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestCustomer < MiniTest::Test

    def setup

        @drink1 = Drink.new("Hammer", 30, 1)
        @drink2 = Drink.new("TheDrill", 35, 2)
        @drink3 = Drink.new("Hacksaw", 40, 4)
        @drinks = [@drink1, @drink2, @drink3]

        @customer = Customer.new("Zack", 60, 39)

        @pub = Pub.new("Chanter", 200, @drinks)
    
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

    def test_is_customer_drunk()
        assert_equal()
    end

end