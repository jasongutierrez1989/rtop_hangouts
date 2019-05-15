class RtopHangouts::CLI

    def call
        puts "Rooftop bars:"
        list_bars
        menu
        goodbye
    end

    def list_bars
        @bars = RtopHangouts::Bars.today
        @bars.each.with_index(1) do |bar, i|
            puts "#{i}. #{bar.name} - #{bar.location}"# - #{bar.description}"
        end
    end

    def menu
        input = nil
        while input != 'exit'
            puts "Enter the number of the bar you'd like to check out. To see the full list again, type 'list'. To exit, type 'exit'"
            input = gets.strip.downcase

            if input.to_i > 0
                puts ("#{@bars[input.to_i-1].name} - #{@bars[input.to_i-1].location}")
                puts ("#{@bars[input.to_i-1].description}")
            elsif input == "list"
                list_bars
            elseif input.to_i == 0
                puts "Invalid entry, try again?"
            end
        end
    end

    def goodbye
        puts "Check again before your next night out!"
    end

end