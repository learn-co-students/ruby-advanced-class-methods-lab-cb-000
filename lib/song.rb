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
    c = self.new
    c.save
    c
  end

  def self.new_by_name(name)
    c = self.new
    c.name = name
    c
  end
  def self.create_by_name(name)
    c = self.new_by_name(name)
    c.save
    c
  end
  def self.destroy_all
    @@all = []
  end
  def self.find_by_name(name)
    value = nil
    @@all.each do |track|
      if track.name == name
        value = track
      end
    end
    return value
  end
  def self.find_or_create_by_name(name)
    b = self.create_by_name('b')
    value = ""
    if self.find_by_name(name) == nil
      value = self.create_by_name(name)
    else
      value = self.find_by_name(name)
    end
    @@all.delete(b)
    value
  end
  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end
  def self.new_from_filename(filename)
    useful = filename[0..-5]
    ray = useful.split(" - ")
    track = self.new_by_name(ray[1])
    track.artist_name = ray[0]
    track
  end
  def self.create_from_filename(filename)
    track = self.new_from_filename(filename)
    track.save
  end
end
