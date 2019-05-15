class RtopHangouts::Bars
    attr_accessor :name, :location, :description
    def self.today
        self.scrape_bars
    end

    def self.scrape_bars
        bar = Array.new
        
        bar = self.scrape_thrillist

        bar
    end

    def self.scrape_thrillist
        doc = Nokogiri::HTML(open("https://www.thrillist.com/drink/los-angeles/best-rooftops-in-la-bars-pools-and-more"))

        bar_names = doc.search("h2.save-venue__title").text
        bar_locations = doc.search("h2.save-venue__neighborhood").map(&:text).join('  ')
        bar_descriptions = doc.search("p.save-venue__description").text
        
        bar_array = bar_names.split("  ")
        location_array = bar_locations.split('  ')
        desciption_array = bar_descriptions.split(/[!?.](?=\p{Lu})/)

        i = 0
        bars = Array.new
        while i < bar_array.length
            bar = self.new
            bar.name = bar_array[i]
            bar.location = location_array[i]
            bar.description = desciption_array[i]
            bars << bar
            i += 1
        end
        
        bars
    end

end