#!/bin/bash

wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz
wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz
gzip -d GeoLite2-City.mmdb.gz && gzip -d GeoLite2-Country.mmdb.gz
mv GeoLite2-*.mmdb GeoIP2/
