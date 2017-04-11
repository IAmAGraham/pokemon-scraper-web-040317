class Pokemon


  attr_accessor  :name, :type
  attr_reader :id, :db

  # def initialize(:name, :type, :db, :type)
  #   @name = name
  #   @type = type
  #   @db = db
  #   @type = type
  # end

  def initialize(arguments)
      arguments.each {|k,v| instance_variable_set("@#{k}",v)}
  end

  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
     end

     def self.find(id, db)
       new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
       #new_pokemon = [[1,"Pikachu", "electric"]]
       # binding.pry
       Pokemon.new(id: new_pokemon[0][0], name: new_pokemon[0][1], type: new_pokemon[0][2])
       # binding.pry
     end



end
