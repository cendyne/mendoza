# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.209.6/containers/alpine/.devcontainer/base.Dockerfile

# [Choice] Alpine version: 3.14, 3.13, 3.12, 3.11
ARG VARIANT="3.16"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-alpine-${VARIANT}

RUN apk add --no-cache gcc musl-dev make git build-base man-pages inotify-tools
WORKDIR /build
ARG COMMIT=HEAD
ADD .devcontainer/fake-gitconfig /root/.gitconfig
RUN git clone https://github.com/janet-lang/janet.git . && \
  git checkout $COMMIT && \
  git revert --no-edit 398833ebe333efa751c52d2fa0f0a940d1d9878b && \
  make PREFIX=/usr -j && \
  make test && \
  make PREFIX=/usr install
WORKDIR /jpm
RUN git clone --depth=1 https://github.com/janet-lang/jpm.git . && \
  PREFIX=/usr /usr/bin/janet bootstrap.janet
COPY project.janet /tmp/setup/
WORKDIR /tmp/setup/
RUN jpm deps
WORKDIR /
