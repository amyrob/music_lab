require('pry-byebug')
require_relative('models/albums')
require_relative('models/artists')

artist1 = Artists.new( {'name'=> 'Trivium' })
artist1.save()

artist2 = Artists.new ( {'name' => 'Ellie Goulding'})
artist2.save()

album1 = Albums.new( { 'title' => 'Silence In The Snow', 'genre' => 'thrash metal', 'artist_id' => artist1.id } )
album1.save()

album2 = Albums.new ( {'title' => 'Lights', 'genre' => 'electronic', 'artist_id' => artist2.id})
album2.save()

binding.pry

nil
