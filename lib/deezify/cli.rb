require 'thor'

module Deezify
  class CLI < Thor
    desc 'export PLAYLIST', 'export playlist with id PLAYLIST to your deezer account'

    method_option :user, aliases: '-u', default: 'spotify', desc: 'Specify owner of playlist'

    def export(playlist)
      exporter = Deezify::Exporter.new
      exporter.export_playlist options[:user], playlist
    end
  end
end
