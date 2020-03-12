

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end
    

    def artist_name=(artname)
        @artist = Artist.find_or_create_by_name(artname)
    end



    def self.new_by_filename(filename)
        artist_name = filename.split(" - ")
        song = self.new(artist_name[1].split(".")[0])
        song.artist_name = artist_name[0]
        song
    end
        


    def self.all
        @@all
    end

end