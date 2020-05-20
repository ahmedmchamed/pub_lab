require('minitest/autorun')
require('minitest/reporters')
require_relative('../customer')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestCustomer < MiniTest::Test

    def setup

        @customer = Customer.new("Sara", 25)
    
    end

    def test_customer_name()
        assert_equal("Sara", @customer.name())
    end

    def test_customer_wallet()
        assert_equal(25, @customer.wallet())
    end

end