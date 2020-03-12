class MP3Importer
    attr_accessor :path, :files
    @@all = []

    def initialize(path)
        @path = path
    end

    def files
        Dir.glob('*.mp3', base: 'spec/fixtures/mp3s')
    end

    def import
        files.each{|filename| Song.new_by_filename(filename)}
    end
end