require 'pry'
class Customer
  attr_accessor :name, :age
  
  @@all = []
  
  def initialize(name, age)
    @name = name
    @ages = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip)
    meal = Meal.new(waiter, customer = self, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.customer.object_id == self.object_id }
  end

  def waiters
    meals.collect { |meal| meal.waiter }
  end

end