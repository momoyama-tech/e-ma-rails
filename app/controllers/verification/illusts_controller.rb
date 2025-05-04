module Verification
  class IllustsController < ApplicationController
    def index
      ActionCable.server.broadcast("room_channel", {
        message: "new",
        data: {
          title: "新しいイラストが投稿されました！",
          description: "新しいイラストが投稿されました！",
          urls: {
            wish: "https://e-ma-rails-staging-986464278422.asia-northeast1.run.app/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTAyLCJwdXIiOiJibG9iX2lkIn19--1874ee30d41f23cad5d2d1541e0dbbe98cb82c1f/wish.png",
            name: "https://e-ma-rails-staging-986464278422.asia-northeast1.run.app/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTAxLCJwdXIiOiJibG9iX2lkIn19--6c48cebdb350a6203792932633a1f43ef4e9ed33/name.png",
            illustration: "https://e-ma-rails-staging-986464278422.asia-northeast1.run.app/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTAwLCJwdXIiOiJibG9iX2lkIn19--b7e0505bca12100612a31042b464319b4a72e828/illustration.png"
          }
        }
      })

      render json: { message: "post verification. and send websocket message." }
    end
  end
end
