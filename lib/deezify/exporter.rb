module Deezify
  class Exporter
    def initialize
      @spotify = Deezify::API::Spotify.new
      @deezer = Deezify::API::Deezer.new
    end

    def export_playlist(user_id, playlist_id)
      playlist = @spotify.playlist user_id, playlist_id

      puts playlist.name
      puts playlist.description
      puts playlist.total
    end
  end
end
