require('minitest/autorun')
require('minitest/reporters')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')
require_relative('../food')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestPub < MiniTest::Test

    def setup()
        @drink1 = Drink.new("Hammer", 30, 1)
        @drink2 = Drink.new("TheDrill", 35, 2)
        @drink3 = Drink.new("Hacksaw", 40, 3)
        # @drinks = [@drink1, @drink2, @drink3]

        @stock = {
            @drink1 => 3,
            @drink2 => 4,
            @drink3 => 5
        }

        @customer = Customer.new("Frodo", 60, 32, 6)

        @pub = Pub.new("Chanter", 200, @stock.keys())

        @food = Food.new("Meatballs", 5, 2)

    end

    def test_can_get_pub_name()
        assert_equal("Chanter", @pub.name())
    end

    def test_can_get_till_amount()
        assert_equal(200, @pub.till())
    end

    def test_can_return_number_of_drinks()
        assert_equal(12, @pub.number_of_drinks())
    end

    def test_remove_drink()
        @pub.remove_drink(@drink3)
        assert_equal(4, @stock[:drink3].fetch())
    end 

    def test_add_to_till()
        @pub.add_to_till(100)
        assert_equal(300, @pub.till())
    end

    def test_is_customer_drunk__not_drunk()
        customer = Customer.new("Legolas", 100, 528, 0)
        assert_equal(false, @pub.is_customer_drunk(customer))
    end

    def test_is_customer_drunk__drunk()
        customer = Customer.new("Gimli", 1000, 103, 43)
        assert_equal(true, @pub.is_customer_drunk(customer))
    end
    
    # def test_pub_can_sell_drink_to_customer()
    #     @pub.sell_drink_to_customer("Hammer", @customer)
    #     assert_equal(2, @pub.number_of_drinks())
    #     assert_equal(30, @customer.get_wallet_amount())
    #     assert_equal(230, @pub.till())
    #     assert_equal(7, @customer.drunkenness())
    # end

end