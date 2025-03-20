module Verification
  class IllustsController < ApplicationController
    def index
      ActionCable.server.broadcast("room_channel", {
        message: "新しいイラストが投稿されました！",
        data: {
          title: "新しいイラストが投稿されました！",
          description: "新しいイラストが投稿されました！",
          urls: {
            wish: "https://static.wikia.nocookie.net/pkm/images/7/7a/0385.png/revision/latest?cb=20200226023541&path-prefix=ja",
            name: "https://static.wikia.nocookie.net/pkm/images/5/50/0025.png/revision/latest?cb=20200226022539&path-prefix=ja",
            illustration: "https://appmedia.jp/wp-content/uploads/2019/11/95b3429781493584eb1a4ed0d7360c8e.jpg"
          }
        }
      })

      render json: { message: "post verification. and send websocket message." }
    end
  end
end
