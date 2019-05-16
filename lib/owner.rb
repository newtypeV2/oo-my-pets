class Owner
  # code goes here
  @@all_owner =[]

  attr_reader :name,:species,:cats,:dogs,:pets

    def initialize(name)
      @name=name
      @species = "human"
      @@all_owner << self
      @cats = []
      @dogs = []
      @pets = []
    end

    def say_species
      "I am a #{self.species}."
    end

    def buy_cat(pet_name)
      new_cat = Cat.new(pet_name,self)
      self.cats << new_cat
      # self.pets << new_cat
    end

    def buy_dog(pet_name)
      new_dog = Dog.new(pet_name,self)
       self.dogs << new_dog
       # self.pets << new_dog
    end

    def walk_dogs
      Dog.all.select do |dog|
       dog.owner == self
     end.each do |walked_dog|
       walked_dog.mood = 'happy'
     end
    end

    def feed_cats
      Cat.all.select do |cat|
       cat.owner == self
     end.each do |fed_cat|
       fed_cat.mood = 'happy'
     end
    end

    def sell_pets
      Cat.all.select do |cat|
       cat.owner == self
     end.each do |sold_cat|
       sold_cat.mood = 'nervous'
       sold_cat.owner = nil
     end
     Dog.all.select do |dog|
      dog.owner == self
    end.each do |sold_dog|
      sold_dog.mood = 'nervous'
      sold_dog.owner = nil
    end

    end

    def list_pets
      # binding.pry
      "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
    end






    def self.all
      @@all_owner
    end

    def self.count
      self.all.length
    end

    def self.reset_all
      self.all.clear
    end

end
