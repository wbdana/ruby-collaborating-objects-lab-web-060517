require 'pry'

class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end

  def songs
    @songs
  end

  def self.find_artist(artist)
    self.all.detect { |art| art.name == artist }
  end


  def self.find_or_create_by_name(artist)
    if !self.find_artist(artist)
      self.new(artist)
    else
      self.find_artist(artist)

      # if !self.all.detect { |art| art.name == artist }
      #   artist = self.new(artist)
      # end
      # artist

    end
  end




  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end


end
