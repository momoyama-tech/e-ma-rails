module Verification
  class IllustsController < ApplicationController
    def index
      ActionCable.server.broadcast("room_channel", { message: "新しいイラストが投稿されました！", data: {
        title: "新しいイラストが投稿されました！",
        description: "新しいイラストが投稿されました！",
        url: "https://appmedia.jp/wp-content/uploads/2019/11/95b3429781493584eb1a4ed0d7360c8e.jpg"
      } })

      render json: { message: "post verification. and send websocket message." }
    end
  end
end
