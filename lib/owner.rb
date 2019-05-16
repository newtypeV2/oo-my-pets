class Owner
  # code goes here
  @@all_owner =[]

  attr_reader :name,:species,:cats,:dogs

    def initialize(name)
      @name=name
      @species = "human"
      @@all_owner << self
      @cats = []
      @dogs = []
    end

    def say_species
      "I am a #{self.species}."
    end

    def buy_cat(pet_name)
      new_cat = Cat.new(pet_name,self)
      self.cats << new_cat
    end

    def buy_dog(pet_name)
      new_dog = Dog.new(pet_name,self)
       self.dogs << new_dog
    end

    def get_owned_pet(petClass)
      petClass.all.select do |pet|
        pet.owner == self
      end
    end

    def get_all_pets
      return self.get_owned_pet(Dog) + self.get_owned_pet(Cat)
    end

    def walk_dogs
      self.get_owned_pet(Dog).each do |walked_dog|
       walked_dog.mood = 'happy'
     end
    end

    def feed_cats
      self.get_owned_pet(Cat).each do |fed_cat|
       fed_cat.mood = 'happy'
     end
    end

    def sell_pets
      self.get_all_pets.each do |pet|
        pet.mood='nervous'
        pet.owner = nil
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
