require 'faker'

# Artist--<Song>--<Genre>
Artist.destroy_all
Song.destroy_all
Genre.destroy_all

10.times do
  Artist.create(name: Faker::Name.name ,bio: Faker::Movies::BackToTheFuture.quote)
  Genre.create(name: Faker::Music.genre)
  Song.create(name: Faker::Cannabis.cannabinoid, artist_id: Artist.last.id ,genre_id: Genre.last.id)
end