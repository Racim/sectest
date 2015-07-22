FROM ruby:latest

MAINTAINER Rory McCune <rorym@mccune.org.uk>

WORKDIR /opt/

#General packages and pre-reqs for tools like Metasploit
RUN apt-get update && apt-get install -y \
	build-essential \
	git-core \
	subversion \
	vim \
	wget \
	smbclient \
	nfs-common \
	rsh-client \
	whois \
	snmp \
	libreadline-dev \
	libpq5 \
	libpq-dev \
	libreadline5 \
	libsqlite3-dev \
	libpcap-dev \
	autoconf \
	postgresql \
	pgadmin3 \
	curl \
	zlib1g-dev \
	libxml2-dev \
	libxslt1-dev \
	vncviewer \
	libyaml-dev \
	ssh \
	slurm \
	curl \
	libssl-dev

#Setup nmap
RUN git clone https://github.com/nmap/nmap.git && \
	cd nmap && \
	./configure --without-zenmap && \
	make && \
	make install && \
	rm -rf ../nmap

#Install Metasploit
RUN git clone https://github.com/rapid7/metasploit-framework.git && \
	cd metasploit-framework && \
	gem install bundler && \
	bundle install 

#Install Testing Scripts
RUN git clone https://github.com/raesene/TestingScripts.git && \
	cd TestingScripts && \
	bundle install