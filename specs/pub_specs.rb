require('minitest/autorun')
require('minitest/reporters')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestPub < MiniTest::Test

    def setup()
        @drink1 = Drink.new("Hammer", 30)
        @drink2 = Drink.new("TheDrill", 35)
        @drink3 = Drink.new("Hacksaw", 40)
        @drinks = [@drink1, @drink2, @drink3]
        @pub = Pub.new("Chanter", 200, @drinks)
    end

    def test_can_get_pub_name()
        assert_equal("Chanter", @pub.name())
    end

    def test_can_get_till_amount()
        assert_equal(200, @pub.till())
    end

    def test_can_return_number_of_drinks()
        assert_equal(3, @pub.number_of_drinks())
    end

end