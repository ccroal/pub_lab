require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')


class CustomerTest < MiniTest::Test

  def setup()
    @drink1 = Drink.new("Beer", 3)
    @drink2 = Drink.new("Vodka", 4)
    @drink3 = Drink.new("Cider", 2)

    drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("Howlin Wolf", 200, drinks)
    @customer = Customer.new("Chris", 100, 21)
  end

  def test_customer_has_name()
    assert_equal("Chris", @customer.name)
  end

  def test_customer_has_wallet()
    assert_equal(100, @customer.wallet)
  end

  def test_customer_has_age()
    assert_equal(21, @customer.age)
  end

    def test_customer_can_afford_drink()
    value = @customer.can_afford_to_buy(@drink1.price)
      assert_equal(true, value)
    end


    def test_count_customer_drinks()
      assert_equal(0, @customer.count_drinks_customer)
    end

    def test_get_drink_to_customer()
      @customer.get_drink_to_customer(@drink2)
      assert_equal(1, @customer.count_drinks_customer)
    end

    def test_remove_money_from_customer()
      @customer.remove_money_from_customer(2)
      assert_equal(98, @customer.wallet)
    end


    def test_buy_drink()
      @customer.buy_drink(@pub, "Beer", @customer)
      assert_equal(2, @pub.count_drinks)
      assert_equal(1, @customer.count_drinks_customer)
      assert_equal(97, @customer.wallet)
      assert_equal(203, @pub.till)
    end

end
