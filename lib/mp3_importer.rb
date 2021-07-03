class MP3Importer

    attr_accessor :path, :files

    def initialize(path)
        @path = path 
    end

    def files
        # files = Dir.glob("#{path}/*.mp3").filter{|file| file.split(" - ").last().include?(".mp3")}.map{|file| file.split(" - ").last(2).join(" - ")}
        files = Dir.glob("#{path}/*.mp3").collect{|file| file.gsub("#{path}/", "")}
    end

    def import
        files.each{|file| Song.new_by_filename(file)}
    end


end