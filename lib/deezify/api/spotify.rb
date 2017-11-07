require 'rspotify'

module Deezify
  module API
    class Spotify
      def initialize
        authenticate
      end

      def playlist(user_id, playlist_id)
        RSpotify::Playlist.find user_id, playlist_id
      end

      def authenticate
        RSpotify.authenticate ENV.fetch('SPOTIFY_CLIENT_ID'),
                              ENV.fetch('SPOTIFY_CLIENT_SECRET')
      end

      private :authenticate
    end
  end
end
