class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def Song.all
        @@all
    end

    def Song.new_by_filename(file)
        artist, song = file.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end

    def artist_name=(name) #works w/ new by filename
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

end