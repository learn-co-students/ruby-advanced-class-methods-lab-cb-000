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
    self.all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song
  end

  def self.find_by_name(name)
    self.all.each do |s|
      if s.name == name
        return s
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end


end


s1 = Song.create_by_name("Song 1")
s2 = Song.create_by_name("Song 2")

puts Song.all
puts "#{s1} - \"#{s1.name}\""
puts "#{s2} - \"#{s2.name}\""

puts 'Finding "Song 1"'
puts Song.find_by_name("Song 1")

puts 'Finding "Song 3"'
puts Song.find_by_name("Song 3")

puts 'Finding "Song 1" try #2'
puts Song.find_or_create_by_name("Song 1")

puts 'Finding "Song 3" try #2'
puts Song.find_or_create_by_name("Song 3")

puts Song.all
Song.all.each do |s|
  puts "#{s} - \"#{s.name}\""
end
