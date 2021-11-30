FROM ubuntu:18.04 

#Install development packages we will need
RUN apt update                                &&  \ 
    DEBIAN_FRONTEND=noninteractive apt install -y \
        git                                       \ 
        make                                      \
        cmake                                     \
	libgmp-dev				  \
	libglib2.0-dev				  \
        libssl-dev			          \
        libpq-dev                             &&  \
     apt clean all

#Download PSI repo
WORKDIR /home
RUN git clone --recursive https://github.com/crypto-admin/PSI.git

# Expose the PostgreSQL port
# EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
#VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]


#Tell postgres where to find libseal.so
#ENV LD_LIBRARY_PATH="/usr/local/lib/"

#Meta tags
LABEL author="caoyongchao"
LABEL version="1.0.0"
LABEL date="11/29/2021"
LABEL description="psi test in container"
LABEL gcc_compiler="gcc-10"
LABEL g++_compiler="g++-10"

# Set the default command to run when starting the container
#CMD ["/usr/lib/postgresql/13/bin/postgres", "-D", "/var/lib/postgresql/13/main", "-c", "config_file=/etc/postgresql/13/main/postgresql.conf"]
