class Artist
  attr_accessor :name, :songs
  @@all = []
 
 

  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
   def self.all
     @@all
   end 

 
  def add_song(song)
    @songs << song
    song.artist = self
    song
  end
  
  def songs
    @songs
  end
 
  def save
   @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.name = name
    artist
  end

  def self.find(name)
    self.all.detect { |artist| artist.name == name }
  end
 
  def self.find_or_create_by_name(name)   
    
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end
 
   def songs
    Song.all.select {|song| song.artist == self}
   end

  def print_songs
    songs.each { |song| puts song.name }
  end

end