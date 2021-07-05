class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name=(title)
    song
  end

  def self.create_by_name(title)
    song = self.new_by_name(title)
    @@all << song
    song
  end

  def self.find_by_name(string)
    self.all.detect {|i| i.name == string}
  end

  def self.find_or_create_by_name(string)
    self.find_by_name(string) ? self.find_by_name(string) : self.create_by_name(string)
  end

  def self.alphabetical
    self.all.sort_by { |word| word.name }
  end

  def self.new_from_filename(string)
    arr = string.slice(0...-4).split("-").map! {|a| a.strip!}
    ting = self.create_by_name(arr[1])
    ting.artist_name = arr[0]
    ting
  end

  def self.create_from_filename(data)
    ting = self.new_from_filename(data)
    ting
  end

  def self.destroy_all
    @@all = []
  end
end
