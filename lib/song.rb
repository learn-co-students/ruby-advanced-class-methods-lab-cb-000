class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end





def self.create
  music = self.new
  @@all << music
  music
end

def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end

def self.create_by_name(name)
  music  = self.new
  music.name = name
  @@all << music
  music
end

def self.find_or_create_by_name(name)
#  if self.find_by_name(name) === nil
  #  self.create_by_name(name)
#  else
#    self.find_by_name(name)
#  end
self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)

end

def self.alphabetical
  @@all.sort_by{|x|x.name}
end


def self.find_by_name(name)
  @@all.find {|x| x.name === name}
end

def self.destroy_all
  @@all.clear
end

def self.new_from_filename(filename)
  names = filename.chomp(".mp3").split("-")
  newsong =self.create_by_name(names[1].strip)
  newsong.artist_name = names[0].strip
  newsong

end

def self.create_from_filename(filename)
  newfile = self.new_from_filename(filename)
  @@all << newfile

end






end
