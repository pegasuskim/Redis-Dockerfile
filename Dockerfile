#
# Redis Dockerfile
#
# https://github.com/pegasuskim-dev/docker-redis
#

# Pull base image.
FROM ubuntu:16.04

# Install Redis.
ENV REDIS_USER=redis \
    REDIS_PASS=asdf12 \
    REDIS_PORT=63785 \
    REDIS_DATA_DIR=/var/lib/redis \
    REDIS_LOG_DIR=/var/log/redis


RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  apt-get install -y python-software-properties && \
  apt-get install -y build-essential && \
  apt-get install -y iputils-ping && \
  apt-get install -y net-tools && \
  apt-get install -y libwww-perl && \
  apt-get install -y wget && \
  apt-get install -y make && \
  apt-get install -y vim && \
  apt-get install -y redis-server && \
  sed -i 's/requirepass .*/requirepass !@hyperion78*/' /etc/redis/redis.conf && \
  sed 's/^# requirepass /requirepass /' -i /etc/redis/redis.conf && \
  sed -i 's/port .*/port 63785/' /etc/redis/redis.conf && \

  #sed -e 's/net.core.somaxconn .*/net.core.somaxconn = 65535/g' -i /etc/sysctl.conf && \
  #sed -e 's/vm.overcommit_memory .*/vm.overcommit_memory = 1/g' -i /etc/sysctl.conf && \
  #sed 's/^# bind /bind /' -i /etc/redis/redis.conf && \
  #sed 's/^bind /# bind /' -i /etc/redis/redis.conf && \

  sed -i 's/bind .*/bind 0.0.0.0/' /etc/redis/redis.conf && \
  sed 's/^logfile /# logfile /' -i /etc/redis/redis.conf && \
  sed 's/^daemonize yes/daemonize no/' -i /etc/redis/redis.conf && \
  sed 's/^protected-mode yes/protected-mode no/' -i /etc/redis/redis.conf && \
  sed 's/^# unixsocket /unixsocket /' -i /etc/redis/redis.conf && \
  sed 's/^# unixsocketperm 700/unixsocketperm 777/' -i /etc/redis/redis.conf

  #sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
  #sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
  #sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
  #sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf

# Define working directory.
WORKDIR /
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Define mountable directories.
VOLUME ["/var/lib/redis"]

# Define default command.
#CMD ["redis-server", "/etc/redis/redis.conf"]
CMD ["bash", "/entrypoint.sh"]

# Expose ports.
EXPOSE 63785
