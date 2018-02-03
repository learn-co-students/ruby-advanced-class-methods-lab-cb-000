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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song1 =  self.find_by_name(name)
    if song1 != nil
      song1
    else
      song2 =  self.create_by_name(name)
      song2
    end
  end

  def self.alphabetical
    @@all.sort_by! { |x| x.name.downcase }
  end

  def self.new_from_filename(name)
    rows = name.split(" - ")
    artist = rows[0]
    song_name = rows[1].split(".")
    song_name = song_name[0]
    song = Song.new
    song.name = song_name
    song.artist_name = artist
    song
  end


  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end
end

#   csv_data = "Elon Musk, 45, Tesla
# Mark Zuckerberg, 32, Facebook
# Martha Stewart, 74, MSL
# "
#
# rows = csv_data.split("\n")
# people = rows.collect do |row|
#  data = row.split(", ")
#  name = data[0]
#  age = data[1]
#  company = data[2]
#  person = Person.new
#  person.name = name
#  person.age = age
#  person.company = company
#  person
# end
#
# end
