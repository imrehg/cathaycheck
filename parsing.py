#!/usr/bin/env python2

from bs4 import BeautifulSoup
import sys
html_data=open(sys.argv[1], "r")
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
print "Total balance: %d; Available balance: %d" % (money1, money2)



