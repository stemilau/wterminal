FROM fedora:36

# Set image locale.
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TZ=Europe/Athens

# Expose port 80 by default
EXPOSE 80

#RUN localectl set-locale LANG=en_US.UTF-8

RUN ["dnf", "update", "-y"]

RUN dnf install -y hostname iproute python3 python3-pip neovim tmux ansible which ncurses

RUN pip install ansible-lint

COPY src/html /usr/share/nginx/html
COPY nginx.conf /usr/local/nginx/conf/

# Avoid container exit.
CMD ["nginx", "-g", "daemon off;"]