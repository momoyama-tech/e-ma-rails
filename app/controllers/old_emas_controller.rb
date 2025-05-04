class OldEmasController < ApplicationController
  def index
    emas = Ema.includes(:ema_images).order(:created_at)

    Thread.new do
      emas.each do |ema|
        ActionCable.server.broadcast("room_channel", {
          message: "old",
          data: {
            title: "古いイラストを受信しました",
            description: "古いイラストを受信しました",
            urls: {
              wish: "https://e-ma-rails-staging-986464278422.asia-northeast1.run.app/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTAyLCJwdXIiOiJibG9iX2lkIn19--1874ee30d41f23cad5d2d1541e0dbbe98cb82c1f/wish.png",
              name: "https://e-ma-rails-staging-986464278422.asia-northeast1.run.app/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTAxLCJwdXIiOiJibG9iX2lkIn19--6c48cebdb350a6203792932633a1f43ef4e9ed33/name.png",
              illustration: "https://e-ma-rails-staging-986464278422.asia-northeast1.run.app/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTAwLCJwdXIiOiJibG9iX2lkIn19--b7e0505bca12100612a31042b464319b4a72e828/illustration.png"
            }
          }
        })
        sleep 1
      end
    end

    render json: { message: "post old emas. and send websocket message with old ema datas." }
  end
end
