require 'pry'

class Song

    attr_accessor :name, :artist 
    @@all = []

    def initialize (name)
        # binding.pry
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename (filename)
        # binding.pry
        # associates new song instance with the artist from the filename 
         artist, song = filename.split(" - ")
         new_song = self.new(song)
         new_song.artist_name = artist
         new_song
        #"Michael Jackson - Black or White - pop.mp3"
    end

    def artist_name= (name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
        # binding.pry
    end

#     name
# => "Michael Jackson"

# self
# => #<Song:0x00007fee74aa1f08 @name="Black or White">

end