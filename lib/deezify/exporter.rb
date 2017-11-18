module Deezify
  class Exporter
    def initialize
      @spotify = Deezify::API::Spotify.new
      @deezer = Deezify::API::Deezer.new
    end

    def export_playlist(user_id, playlist_id)
      playlist = @spotify.playlist user_id, playlist_id

      puts playlist.tracks limit: 100
      puts playlist.total

      # puts @deezer.create_playlist playlist.name
      # puts @deezer.add_tracks '3818197642', '15928237', '97463796'
      # puts @deezer.search(nil,
      #                     artist: 'queen',
      #                     track: 'show must go on',
      #                     album: 'Greatest Hits II').first

      # @TODO: add progress bar
      # @TODO: check playlist existence and recreate it
    end
  end
end
