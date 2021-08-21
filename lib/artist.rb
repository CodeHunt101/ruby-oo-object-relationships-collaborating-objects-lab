class Artist
  attr_accessor :name
  
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    if self.all.all? {|artist| artist.name != name}
      new_artist = self.new(name)
      self.all << new_artist
      new_artist
    else
      self.all.find {|artist| artist.name == name }
    end
  end

  def print_songs
    puts (songs.map {|song| song.name})
  end

end