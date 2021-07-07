require 'pry'
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        artist, song = filename.split(" - ")
        genre = filename.split(" - ")[2].chomp(".mp3")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
    end
end