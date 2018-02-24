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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new = create
    new.name = name
    new
  end

  def self.create_by_name(name)
    new_by_name(name)
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) == nil ? create_by_name(name) : find_by_name(name)
  end

  def self.alphabetical
    all.sort_by {|song| song.name }
  end

  def self.new_from_filename(file)
    file_split = file.split(/\s?[-.]\s?/)
    new = create_by_name(file_split[1])
    new.artist_name = file_split[0]
    new
  end

  def self.create_from_filename(file)
    new_from_filename(file)
  end

  def self.destroy_all
    all.clear
  end

end
