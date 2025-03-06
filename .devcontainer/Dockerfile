# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.1
FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION

# 必要なパッケージをインストール（GPG鍵の更新を追加）
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    gnupg \
    imagemagick \
    graphicsmagick \
    && rm -rf /var/lib/apt/lists/*
