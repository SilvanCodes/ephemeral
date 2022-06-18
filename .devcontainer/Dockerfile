ARG RUNNER_IMAGE="debian:bullseye-20210902-slim"

# does user setup and gives 'install-packages' script, see https://github.com/gitpod-io/workspace-images
FROM gitpod/workspace-base:commit-f2d623ca9d270c2ce8560d2ca0f9ce71b105aff2 as development

USER root

# get inotify-tools for live reload from phoenix, see: https://hexdocs.pm/phoenix/installation.html#inotify-tools-for-linux-users
RUN install-packages inotify-tools

# install common utilities
RUN install-packages \
    curl

USER gitpod

# install flyctl, see: https://fly.io/docs/getting-started/installing-flyctl/
RUN curl -L https://fly.io/install.sh | sh

# setup asdf-vm: https://asdf-vm.com/guide/getting-started.html
RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.10.0 \
    && echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc \
    && echo '. $HOME/.asdf/completions/asdf.bash' >> $HOME/.bashrc

# in the following 'bash -i -c' is used to have asdf available as '-i' reads from .bashrc

# install and pin asdf erlang plugin: https://github.com/asdf-vm/asdf-erlang
RUN bash -i -c 'asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git && asdf plugin update erlang 98139db9abebb7fb4eeef1837904c102779e870e'

# install and pin asdf elixir plugin: https://github.com/asdf-vm/asdf-elixir
RUN bash -i -c 'asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && asdf plugin update elixir d08f506b72faddff571b819f586219295bf89d99'

# install and pin asdf direnv plugin: https://github.com/asdf-community/asdf-direnv
RUN bash -i -c 'asdf plugin-add direnv https://github.com/asdf-community/asdf-direnv.git && asdf plugin update direnv a5aefdf8c7df2898053bc6db1f5936de28c45aef'

# get .tool-versions from repo
COPY .tool-versions $HOME/

# install versions specified in .tool-versions
RUN bash -i -c 'asdf install'

# run direnv setup
RUN bash -i -c "asdf direnv setup --shell bash --version $(cat ~/.tool-versions | grep direnv | awk '{print $2}')"

# install hex
RUN bash -i -c 'mix archive.install github hexpm/hex ref 52be75c14b5623ba424a50dafdb56611a939af7d --force'

# install rebar
RUN bash -i -c 'mix local.rebar --force'


FROM development as builder

# prepare build dir
WORKDIR /app

# set build ENV
ENV MIX_ENV="prod"

# install mix dependencies
COPY mix.exs mix.lock ./
RUN bash -i -c 'mix deps.get --only $MIX_ENV'
RUN mkdir config

# copy compile-time config files before we compile dependencies
# to ensure any relevant config change will trigger the dependencies
# to be re-compiled.
COPY config/config.exs config/${MIX_ENV}.exs config/
RUN bash -i -c 'mix deps.compile'

COPY priv priv

# note: if your project uses a tool like https://purgecss.com/,
# which customizes asset compilation based on what it finds in
# your Elixir templates, you will need to move the asset compilation
# step down so that `lib` is available.
COPY assets assets

# Compile the release
COPY lib lib

RUN bash -i -c 'mix compile'

# compile assets
RUN bash -i -c 'mix assets.deploy'

# Changes to config/runtime.exs don't require recompiling the code
COPY config/runtime.exs config/

COPY rel rel
RUN bash -i -c 'mix release'

# start a new build stage so that the final image will only contain
# the compiled release and other runtime necessities
FROM ${RUNNER_IMAGE}

RUN apt-get update -y && apt-get install -y libstdc++6 openssl libncurses5 locales \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR "/app"
RUN chown nobody /app

# Only copy the final release from the build stage
COPY --from=builder --chown=nobody:root /app/_build/prod/rel/ephemeral ./

USER nobody

CMD ["/app/bin/server"]

# Appended by flyctl
ENV ECTO_IPV6 true
ENV ERL_AFLAGS "-proto_dist inet6_tcp"
