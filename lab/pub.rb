class Pub

attr_reader :name, :till, :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end



  def count_drinks()
    @drinks.count
  end

  def find_the_drink(drink)
  for customer_drink in @drinks
    if (customer_drink.name == drink)
      return customer_drink
    end
  end
  return nil
end

  def remove_drink(drink)
    customer_drink = @drinks.delete(drink)
    return customer_drink
  end

  def add_money_to_till(price)
    @till += price
  end

  def customer_is_old_enough(customer, drink)
      if customer.age >= 18
        sell_drink_to_customer(drink)
    else
      return "Not old enough"
    end
  end

  def sell_drink_to_customer(drink)
    drink_to_sell = find_the_drink(drink)
    customer_drink = remove_drink(drink_to_sell)
    add_money_to_till(customer_drink.price)
    return customer_drink
  end






end
