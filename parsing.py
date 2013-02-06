#!/usr/bin/env python2

from bs4 import BeautifulSoup
import pytz
import time
import datetime
import sys

def getTime():
    taipei = pytz.timezone('Asia/Taipei')
    val = datetime.datetime.now(tz=taipei)
    return time.strftime("%Y-%m-%dT%H:%M:%S+0800", val.timetuple())

html_data =open(sys.argv[1], "r")
html_doc=html_data.read()

soup = BeautifulSoup(html_doc)
t = soup.table.table
rows = t.findAll('tr', {"class" : "IC1"})
goodrow = rows[1]
parts = goodrow.findAll('td')

def getInt(str):
    return int(str.replace(',', ''))

money1 = getInt(parts[4].string)
money2 = getInt(parts[5].string)
print "%s, %d, %d" % (getTime(), money1, money2)



