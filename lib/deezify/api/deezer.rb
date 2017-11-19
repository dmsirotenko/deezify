require 'faraday'
require 'json'

module Deezify
  module API
    class Deezer
      def initialize
        @connection = connection
      end

      def user_info
        res = @connection.get do |req|
          req.url '/user/me'
        end

        json_decode res.body
      end

      def search(query, params={})
        unless params.empty?
          query = params.map{ |k, v| %Q(#{k}:"#{v}") }.join(' ')
        end

        res = @connection.get do |req|
          req.url '/search'
          req.params[:q] = query
        end

        json_decode(res.body)[:data]
      end

      def create_playlist(title)
        res = @connection.post do |req|
          req.url '/user/me/playlists'
          req.params[:title] = title
        end

        json_decode res.body
      end

      def add_tracks(playlist_id, *tracks)
        @connection.post do |req|
          req.url "/playlist/#{playlist_id}/tracks"
          req.params[:songs] = tracks.join ','
        end
      end

      def connection
        Faraday.new url: 'https://api.deezer.com/' do |conn|
          conn.adapter Faraday.default_adapter
          conn.params[:access_token] = ENV.fetch('DEEZER_ACCESS_TOKEN')
        end
      end

      def json_decode(string)
        JSON.parse string, symbolize_names: true
      end

      private :connection, :json_decode
    end
  end
end
