FROM ubuntu:latest

ARG USERNAME=bashar

RUN useradd -ms /bin/bash ${USERNAME}

WORKDIR /home/$USERNAME

RUN rm .bashrc

COPY . .files

RUN .files/etc/scripts/install.sh .

USER $USERNAME

RUN .files/etc/scripts/stow.sh .

RUN nvim --headless "+Lazy! sync" +qa
