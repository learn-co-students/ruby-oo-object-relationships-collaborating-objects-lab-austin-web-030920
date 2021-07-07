require 'pry'
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.new_by_filename(filename)
        parts = filename.split(" - ")
        artist = parts[0]
        song = parts[1]

        new_song = self.new(song)
        new_song.artist_name = artist
        return new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        # artist.add_song(self)
    end
end