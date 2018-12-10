require("minitest/autorun")
require('minitest/rg')
require_relative("../song")

class SongTest < Minitest::Test

  def setup
    @song = Song.new("Happy Birthday", "1:20")
  end

  def test_song_name
    assert_equal("Happy Birthday", @song.song_name)
  end

  def test_song_length
    assert_equal("1:20", @song.song_length)
  end


end
