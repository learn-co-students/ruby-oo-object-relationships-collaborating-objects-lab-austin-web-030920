
class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def add_song(song)
        song.artist_name = @name
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def print_songs
        songs.each{|song|puts song.name}
    end



    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        @@all.find{|artist| artist.name == name} || Artist.new(name)
    end


end