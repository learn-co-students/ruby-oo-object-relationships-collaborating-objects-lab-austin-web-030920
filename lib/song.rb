class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        #creates a new instance of a song from the file that's passed 
        #associates new song instance with the artist from the filename 
        singer,name = filename.split(' - ')
        song= Song.new(name.split('.')[0])
        song.artist_name=singer
        song
    end

    def artist_name=(name)
       @artist = Artist.find_or_create_by_name(name) 
    end
end