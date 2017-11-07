# Deezify

A simple command line tool that can export any Spotify playlists to your Deezer account.

## Installation

Install it using command:

    $ gem install deezify
    
## Configuration

Before using this tool, you should set the following environment variables:

- ``SPOTIFY_CLIENT_ID`` and ``SPOTIFY_CLIENT_SECRET``: You can easily generate them [here](https://developer.spotify.com/my-applications)

## Usage

Export a playlist created by spotify:

    $ deezify export PLAYLIST_ID
    
Or by any other user:
    
    $ deezify export PLAYLIST_ID -u=USER

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
