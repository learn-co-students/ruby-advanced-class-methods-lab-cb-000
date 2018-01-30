require 'pry'
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
    x = self.new
    x.save
    x
  end
  def self.new_by_name(i)
    x = self.new
    x.name = i
    x
  end
  def self.create_by_name(i)
    x = self.new
    x.name = i
    x.save
    x
  end
  def self.find_by_name(i)
    @@all.detect {|x| x.name == i}
  end
  def self.find_or_create_by_name(i)
    if self.find_by_name(i) != nil
      @@all.detect {|x| x.name === i}
    else
      self.create_by_name(i)
    end
  end
  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end
  def self.new_from_filename(i)
    y = self.new
    x = i.chomp(".mp3").split(" - ")
    y.name = x[1]
    y.artist_name = x[0]
    y
  end
  def self.create_from_filename(i)
    y = self.new
    x = i.chomp(".mp3").split(" - ")
    y.name = x[1]
    y.artist_name = x[0]
    y.save
    y
  end
  def self.destroy_all
    @@all.clear
  end
end
