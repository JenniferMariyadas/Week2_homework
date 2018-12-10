require('MiniTest/autorun')
require('MiniTest/rg')
require_relative("../room")
require_relative("../guest")
require_relative("../song")

class RoomTest < Minitest::Test

def setup
@room = Room.new("Blue room", 30, [], [], 5)
@guest1 = Guest.new("Chris","Step into Christmas", 100)
end

def test_room_name
  assert_equal("Blue room", @room.room_name)
end


def test_room_size
  assert_equal(30, @room.room_size)
end

def test_room_guest_array
  assert_equal([], @room.room_guest_array)
end

def test_room_playlist_array
  assert_equal([], @room.room_playlist_array)
end

def test_room_price
  assert_equal(5, @room.room_price)
end

def test_guest_count
  assert_equal(0, @room.guest_count)
end

def test_add_guest_to_room
  guest1 = Guest.new("Chris","Step into Christmas", 100)
  @room.add_guest_to_room(guest1)
  assert_equal(1, @room.guest_count)
end

def test_remove_guest_to_room
  guest1 = Guest.new("Bob", "Merry Christmas Everyone", 50)
  guest2 = Guest.new("Sally", "Last Christmas", 1500)
  @room.add_guest_to_room(guest1)
  @room.add_guest_to_room(guest2)
  @room.remove_guest_to_room(guest1)
  assert_equal(1, @room.guest_count)
end


def test_playlist_count
  assert_equal(0, @room.playlist_count)
end


def test_add_song_to_playlist
  song1 = Song.new("Jingle Bells","3:30")
  @room.add_song_to_playlist(song1)
  assert_equal(1, @room.playlist_count)
end

def test_available_space_true
  room2 = Room.new("Green room", 2, [], [], 5)
  assert_equal(true, room2.check_available_space)
end

def test_available_space__false
  room2 = Room.new("Green room", 0, [], [], 5)
  assert_equal(false, room2.check_available_space)
end

def test_check_guest_into_room_space__available
 room3 = Room.new("Red room",1, [], [], 5)
 availability = room3.check_available_space

 room3.check_guest_into_room_space_available(availability,@guest1)
 assert_equal(1, room3.guest_count)
end

def test_check_guest_into_room_space__unavailable
 room3 = Room.new("Red room",0, [], [], 5)
 availability = room3.check_available_space

 room3.check_guest_into_room_space_available(availability,@guest1)
 assert_equal(0, room3.guest_count)
 assert_equal("sorry come back tomorrow", room3.check_guest_into_room_space_available(availability,@guest1))
end

def test_guest_have_enough_money__true
  room4 = Room.new("Yellow room", 2, [], [], 5)
  assert_equal(true, room4.guest_have_enough_money(@guest1))
end

def test_guest_have_enough_money__false
  room5 = Room.new("Purple room",2, [], [], 105)
  assert_equal(false, room5.guest_have_enough_money(@guest1))
end

def test_add_guest_to_room_if_enough_money_and_space_available
 room6 = Room.new("Gold room", 2, [], [], 10)
 availability = room6.check_available_space
 enough_money = room6.guest_have_enough_money(@guest1)

 room6.add_guest_to_room_if_enough_money_and_space_available(availability, enough_money, @guest1)
 assert_equal(1, room6.guest_count)
end

def test_guest_can_cheer_for_their_favourite_song
  room7 = Room.new("Silver room", 2, [], ["Step into Christmas"], 5)
  assert_equal("Whoo!", room7.guest_can_cheer_for_their_favourite_song(@guest1))
end


end
