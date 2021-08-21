class Song
  attr_accessor :name, :artist
  @@all = []
  
  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file_name)
    file_name_arr = file_name.split(' - ')
    new_song = self.new(file_name_arr[1])
    new_song.artist = Artist.new(file_name_arr[0])
    new_song
  end

  def artist_name=(artist_name)
    if Artist.all.all? {|artist| artist.name != artist_name}
      self.artist = Artist.new(artist_name)
    else
      self.artist = Artist.all.find{|artist| artist.name == artist_name}
    end
  end

end