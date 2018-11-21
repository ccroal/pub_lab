class Customer

attr_reader :name, :wallet, :age

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drinks = []
  end


#   def sell_drink_to_customer(pub, drink, price)
#     if pub.find_the_drink(drink) && can_afford_to_buy() ==  true
#     customer_drink = pub.remove_drink(drink)
#     get_drink_to_customer(customer_drink)
#     drink_price = customer_drink.price
#     remove_money_from_customer(drink_price)
#     pub.add_money_to_till(drink_price)
#   end
# end


  def count_drinks_customer()
    @drinks.count
  end


  def can_afford_to_buy(price)
    if price <= @wallet
      return true
    else
      return "insufficient funds"
    end
  end


  def get_drink_to_customer(name)
    @drinks << name
  end

  def remove_money_from_customer(price)
    @wallet -= price
  end

  def buy_drink(pub, drink, customer)
      customer_drink = pub.customer_is_old_enough(customer, drink)
      get_drink_to_customer(customer_drink)
      price = customer_drink.price
      remove_money_from_customer(price)
  end


end
