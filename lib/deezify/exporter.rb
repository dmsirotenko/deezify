module Deezify
  class Exporter
    def initialize
      @spotify = Deezify::API::Spotify.new
      @deezer = Deezify::API::Deezer.new
    end

    def export_playlist(user_id, playlist_id)
      playlist = @spotify.playlist user_id, playlist_id
      deezer_tracks = []

      puts "Starting to export: #{playlist.name}"

      playlist.tracks(limit: 100).each do |track|
        track_info = find_track(track)
        deezer_tracks.push track_info[:id] unless track_info.nil?
      end

      create_playlist playlist.name, deezer_tracks

      puts "Successfully added #{deezer_tracks.size} tracks"

      # @TODO: export more than 100 tracks
      # @TODO: add progress bar
      # @TODO: check playlist existence and recreate it

      # @FIXME: sometimes finds wrong tracks or doesn't find track at all
    end

    def find_track(track)
      search_params = {
          artist: track.artists.map(&:name).join(' '),
          name: track.name,
          album: track.album.name
      }

      tracks = @deezer.search search_params.values.join ' '

      tracks.first unless tracks.empty?
    end

    def create_playlist(name, tracks)
      playlist = @deezer.create_playlist "#{name} on Spotify"
      @deezer.add_tracks playlist[:id], tracks
    end

    private :find_track, :create_playlist
  end
end
