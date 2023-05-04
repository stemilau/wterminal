FROM fedora:36

# Set image locale.
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TZ=Europe/Athens

# Expose port 80 by default
EXPOSE 80

STOPSIGNAL SIGQUIT

#RUN localectl set-locale LANG=en_US.UTF-8

# system update
RUN ["dnf", "update", "-y"]

# install needed packages
RUN dnf install -y hostname iproute python3 python3-pip neovim tmux ansible which ncurses nginx npm

# installing ansible-lint via pip for linting support when writting ansible
RUN pip install ansible-lint

# install xterm.js web terminal emulator
RUN pwd
RUN npm install xterm

# configure nginx
COPY src/html /usr/share/nginx/html
COPY nginx.conf /usr/local/nginx/conf/

# Ensure nginx runs endlessly
CMD ["nginx","-g", "daemon off;"]