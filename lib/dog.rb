class Dog
  # code goes here
  @@all_dogs = []

  attr_reader :name
  attr_accessor :mood, :owner

    def initialize(name,owner,mood="nervous")
      @name = name
      @owner = owner
      @mood = mood
      @@all_dogs << self
    end

    def self.all
      @@all_dogs
    end

end
