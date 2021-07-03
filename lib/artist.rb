class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.filter{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        artist = self.all.find{|artist| artist.name == name}
        if artist
            artist
        else
            Artist.new(name)
        end
    end

    def print_songs
        songs.each{|song| puts song.name}
    end

end