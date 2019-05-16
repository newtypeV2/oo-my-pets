class Cat
  # code goes here
  @@all_cats = []

  attr_reader :name
  attr_accessor :mood,  :owner

    def initialize(name,owner,mood="nervous")
      @name = name
      @owner = owner
      @mood = mood
      @@all_cats << self
    end

    def self.all
      @@all_cats
    end

end
