require('minitest/autorun')
require('minitest/reporters')
require_relative('../drink')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestDrink < MiniTest::Test

    def setup

        @drink = Drink.new("Screwdriver", 10)
    
    end

    def test_name()
        assert_equal("Screwdriver", @drink.name)
    end

    def test_price()
        assert_equal(10, @drink.price)
    end

end