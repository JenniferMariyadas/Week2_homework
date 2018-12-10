require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")

class GuestTest < Minitest::Test

def setup
  @guest = Guest.new("Jennifer", "Time in a bottle", 20)
end

def test_guest_name
  assert_equal("Jennifer", @guest.guest_name)
end

def test_guest_favourite_song
  assert_equal("Time in a bottle", @guest.guest_favourite_song_name)
end


def test_guest_money
  assert_equal(20, @guest.guest_money)
end

def test_guest_talk
  assert_equal("Whoo!", @guest.guest_talk)
end







end
