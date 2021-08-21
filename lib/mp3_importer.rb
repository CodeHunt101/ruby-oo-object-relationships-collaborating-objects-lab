class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end

  def files
    Dir.entries("spec/fixtures/mp3s").slice(2..-1)
  end

  def import
    files.each{|file| Song.new_by_filename(file)}
  end

end