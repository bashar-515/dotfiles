FROM ubuntu:latest AS builder

ARG USERNAME=bashar

RUN useradd -ms /bin/bash ${USERNAME}

WORKDIR /home/$USERNAME

FROM builder AS dev

COPY dotfiles.copy .files

RUN ./.files/install.sh ./

USER $USERNAME

RUN ./.files/stow.sh ./

RUN nvim --headless "+Lazy! sync" +qa

FROM builder AS prod

# TODO: use the Docker `ADD` directive to install the repository and its submodules
RUN apt-get update && \
    apt-get install -y \
    git

RUN git clone --recursive https://github.com/bashar-515/dotfiles.git ./.files

RUN ./.files/install.sh ./

USER $USERNAME

RUN ./.files/stow.sh ./

RUN nvim --headless "+Lazy! sync" +qa
