require_relative('../db/sql_runner.rb')

class Artists

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists(name)
    VALUES ($1)
    RETURNING * ;"

    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update
    sql = "UPDATE artists
    SET (name) = ($1)
    WHERE id = $2;"

    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"

    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Artists.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map { |artist_hash| Artists.new(artist_hash) }
  end

  def Artists.select()
sql = "SELECT * FROM artist WHERE id = $1"
artists = SqlRunner.run(sql)
return artists.map { |artist_hash| Artists.new(artist_hash) }
  end

end #end of class
