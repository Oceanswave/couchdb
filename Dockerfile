version	0.1
maintainer Sean McLellan <sean.mclellan@baristalabs.com>

FROM dockerfile/ubuntu
RUN	apt-get update
RUN	apt-get install -y couchdb && /etc/init.d/couchdb stop
RUN	sed -e 's/^bind_address = .*$/bind_address = 0.0.0.0/' -i /etc/couchdb/default.ini
EXPOSE	5984

#Hmmm, make the .ini come from a mounted volume.
CMD	["/bin/sh", "-e", "/usr/bin/couchdb", "-a", "/etc/couchdb/default.ini", "-a", "/etc/couchdb/local.ini", "-b", "-r", "5", "-p", "/var/run/couchdb/couchdb.pid", "-o", "/dev/null", "-e", "/dev/null", "-R"]
