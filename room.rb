class Room

attr_reader :room_name, :room_size, :room_guest_array, :room_playlist_array, :room_price

def initialize(room_name, room_size, room_guest_array, room_playlist_array, room_price)
  @room_name = room_name
  @room_size = room_size
  @room_guest_array = room_guest_array
  @room_playlist_array = room_playlist_array
  @room_price = room_price
end

def guest_count
  return @room_guest_array.length
end

def add_guest_to_room(guest)
  @room_guest_array.push(guest)
end


def remove_guest_to_room(guest)
  @room_guest_array.delete(guest)
end

def playlist_count
  return @room_playlist_array.length
end

def add_song_to_playlist(song)
  @room_playlist_array.push(song)
end

def check_available_space
   if guest_count < @room_size
   return true
  else
   return false
  end
end

def check_guest_into_room_space_available(availability,guest)
  if availability == true
    add_guest_to_room(guest)
  else
    return "sorry come back tomorrow"
  end
end

def guest_have_enough_money(guest)
  if guest.guest_money >= @room_price
   return true
  else return false
  end
end

def add_guest_to_room_if_enough_money_and_space_available(availability, enough_money, guest)
  if availability == true && enough_money == true
    add_guest_to_room(guest)
  else
    return "Sorry, there is no enough space or you don't have enough money"
  end
end

def guest_can_cheer_for_their_favourite_song(guest)
  for song in @room_playlist_array
    if guest.guest_favourite_song_name == song
      return guest.guest_talk
    end
  end
end  

end
