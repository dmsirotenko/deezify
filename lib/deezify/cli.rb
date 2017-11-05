require 'thor'
require 'rspotify'

module Deezify
  class CLI < Thor
    desc 'import PLAYLIST', 'import playlist with id PLAYLIST'

    method_option :user, aliases: '-u', default: 'spotify', desc: 'Specify owner of playlist'

    no_commands do
      def authenticate
        RSpotify.authenticate ENV.fetch('SPOTIFY_CLIENT_ID'),
                              ENV.fetch('SPOTIFY_CLIENT_SECRET')
      end
    end

    def import(playlist)
      authenticate

      playlist = RSpotify::Playlist.find options[:user], playlist
      puts playlist.name
    end
  end
end