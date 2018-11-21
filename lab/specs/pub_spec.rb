require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')



class PubTest < MiniTest::Test

  def setup()

    @customer = Customer.new("Chris", 100, 15)

    @drink1 = Drink.new("Beer", 3)
    @drink2 = Drink.new("Vodka", 4)
    @drink3 = Drink.new("Cider", 2)

    drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("Howlin Wolf", 200, drinks)
  end


  def test_pub_has_name()
    assert_equal("Howlin Wolf", @pub.name)
  end

  def test_pub_has_till()
    assert_equal(200, @pub.till)
  end

  def test_pub_has_drinks()
    assert_equal(3, @pub.count_drinks)
  end

  def test_pub_find_drink_by_name()
    customer_drink = @pub.find_the_drink("Vodka")
    assert_equal(@drink2, customer_drink)
  end

  def test_customer_age_not_old_enough
    result = @pub.customer_is_old_enough(@customer, "Vodka")
    assert_equal("Not old enough", result)
  end

  def test_remove_drink()
    @pub.remove_drink(@drink2)
    assert_equal(2, @pub.count_drinks)
  end

  # def test_what_is_remove_drink()
  #   removed_drink = @pub.remove_drink(@drink2)
  #   assert_equal(2, removed_drink)
  # end

  def test_add_money_to_till()
    @pub.add_money_to_till(3)
    assert_equal(203, @pub.till)
end

  def test_sell_drink_to_customer()
    @pub.sell_drink_to_customer("Vodka")
    assert_equal(2, @pub.count_drinks)
    assert_equal(204, @pub.till)
  end



end
