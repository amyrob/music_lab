require('pry-byebug')
require_relative('models/albums')
require_relative('models/artists')

artist1 = Artists.new( {'name'=> 'Trivium' })
artist1.save()



album1 = Albums.new( { 'title' => 'Silence In The Snow', 'genre' => 'thrash metal', 'artist_id' => artist1.id } )
album1.save()

binding.pry

nil
