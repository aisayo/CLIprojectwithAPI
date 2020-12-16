# what do you want your object model to look like


class Starship

    @@all = []

    attr_accessor :name, :model, :manufacturer

    # def initialize(name, model, manufacturer)
    #     @name = name
    #     @model = model 
    #     @manufacturer = manufacturer
    #     save 
    # end 

    def initialize(starship_hash)
        starship_hash.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end 
        save
    end 

    def save 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    # a method that accepts the starships name, and finds the object
    # with that name 

    def self.find_starship(starship_name)
        self.all.find do |starship|
            starship.name == starship_name 
        end 
    end 


end 