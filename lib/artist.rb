require_relative 'song'
class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
       
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        # binding.pry
        Song.all.select { |song| song.artist == self }
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        found = self.find(name)
        found ? found : self.new(name) 
    end

    def self.find(name)
        @@all.find { |artist| artist.name == name }
    end

    def print_songs
        puts self.songs.map { |song| song.name }
    end
end