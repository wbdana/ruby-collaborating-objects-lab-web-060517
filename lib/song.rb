class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def name
    @name
  end

  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
    @artist.add_song(self)
  end

  def self.artist
    @artist
  end

  def self.new_by_filename(filename)
    file_name_array = filename.split(" - ")
    song = Song.new(file_name_array[1])
    song.artist_name=(file_name_array[0])
    song
  end

end
