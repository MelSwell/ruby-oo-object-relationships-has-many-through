class Waiter
  attr_accessor :name, :years_of_experience
  
  @@all = []
  
  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    meal = Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter.object_id == self.object_id }
  end

  def best_tipper
    meals.sort { |meal1, meal2| meal2.tip <=> meal1.tip }.first.customer
  end

end