class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast("room_channel", data)
  end
end
