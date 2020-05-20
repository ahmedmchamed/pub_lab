require('minitest/autorun')
require('minitest/reporters')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestPub < MiniTest::Test

    def setup()
        @pub = Pub.new("Chanter", 200)
    end

    def test_can_get_pub_name()
        assert_equal("Chanter", @pub.name())
    end

    def test_can_get_till_amount()
        assert_equal(200, @pub.till())
    end

end