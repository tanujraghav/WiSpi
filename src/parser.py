#!/usr/bin/env python3

from configparser import ConfigParser
import sys

config = ConfigParser()
config.read(sys.argv[1])

connection = config.get('connection', 'id')
identity = config.get('802-1x', 'identity')
password = config.get('802-1x', 'password')

fileObject = open('/tmp/wifi-nmconnection-tracker.txt', 'w')

fileObject.write("Network :" + connection + "\n")
fileObject.write("Identity:" + identity + "\n")
fileObject.write("Password:" + password + "\n")
