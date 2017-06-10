require 'pry'

class MP3Importer

  attr_accessor :path

  @@all = []

  def initialize(file_path)
    @path = file_path
  end

  def self.all
    @@all
  end

  def files
    files = []
    Dir["#{path}/*.mp3"].each do |file|
      file[0..20] = ""
      files << file
    end
    files
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end

    #
    # self.files.each do |file|
    #   # binding.pry
    #   file_name_array = file.split(" - ")
    #   song = Song.new_by_filename(file_name_array[1])
    #   song.artist_name=(file_name_array[0])
    # end
      # Need to import OBJECTS into Artist.all arrays by
      # matching file name strings to
      # relevant_artist = Artist.all.detect{|artist| artist.name == file_name_array[1]}
      # Artist.all << file_name_array[0] if !Artist.all.include?(file_name_array[0])
      # relevant_artist.songs << file_name_array[1]
  end


end

# Pry.start
