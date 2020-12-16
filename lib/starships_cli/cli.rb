# responsible communicating between user and data 

class CLI 

    # an entryway method 

    def start 
        puts "Welcome to the Starship Lot, shopping for a new starship?"
        puts "Let's start with your name:"
        API.get_data
        # binding.pry
        greet(user_input)
    end 

    def user_input 
        gets.strip 
    end 

    def greet(name)
        puts "awesome #{name}, would you like to see our starships?"
        puts "Input 'y' to see the list, 'exit' to leave the lot!"
        menu
    end 

    # print to out a list of all starships 
    def starships_list 
        Starship.all.each.with_index(1) do |starship, i|
            puts ""
            puts ""
            puts "#{i}. #{starship.name}"
        end 
        starship_selection
    end 

    def goodbye
        puts "Hopefully you'll come back! But bye for now!" 
    end 

    def invalid 
        puts "Hmm, that doesnt seem valid, try again?"
        menu
    end 

    def starship_selection
        puts "Select a starship for more detail"

        selection = user_input 
        starship = Starship.find_starship(selection)
        starship_details(starship)
        # we'll query our Starship class to find the starships detail 
    end 

    def starship_details(starship)
        puts ""
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Name: #{starship.name}"
        puts "Model: #{starship.model}"
        puts "Manufacturer: #{starship.manufacturer}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

        menu
    end 


    # based on user selection, either show a list of starships, 
    # give them an error message 
    # exit 

    def menu 
        selection = user_input 

        if selection == 'y' 
            starships_list
            menu 
        elsif selection == 'exit'
            goodbye
        else 
            invalid
        end 

    end 

end 