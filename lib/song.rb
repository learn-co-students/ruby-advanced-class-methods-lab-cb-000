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
		# @@all << song
		song.save
		song
	end

	def self.new_by_name(name)
		song = self.create
		song.name = name
		song
	end

	def self.create_by_name(name)
		self.new_by_name(name)
	end

	def self.find_by_name(name)
		self.all.detect {|song| song.name == name}
	end

	def self.find_or_create_by_name(name)
		song = self.find_by_name(name)
		(song)? song : self.create_by_name(name)
	end

	def self.alphabetical
		self.all.sort {|s1, s2| s1.name <=> s2.name}
	end

	def self.new_from_filename(filename)
		strs = filename.split('.')[0].split(' - ')
		name = strs[1]
		artist_name = strs[0]
		song = self.find_or_create_by_name(name)
		song.artist_name = artist_name
		song
	end

	def self.create_from_filename(filename)
		self.new_from_filename(filename)
	end

	def self.destroy_all
		self.all.clear
	end
end
