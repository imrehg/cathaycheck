# CathayCheck

Check the bank account balance with a script so it can be done automatically.

Credentials are the ID number, PIN, and a code chosen by the user, they are passed with
environmental variables at the moment.
Eg. in Linux: export ID=xxxxxxxxxx; export PIN=xxxx; export CODE=xxxxxx

Fixing a bunch of small tidbits, and will eventually move to a single file Python solution.

The output has a format as

    2013-03-06T09:59:52+0800, 12345, 9876

which has the current date, total balance, and available balance. The date is fully qualified, though formatted for Taiwan's time zone since I'm here. Units are TWD (New Taiwan Dollar).

## Usage from cron

    55 23 * * * export ID=XXXX; export PIN=XXXX; export CODE=XXXX; cd /home/user/cathaycheck; BALANCE=$(./banking.sh); echo $BALANCE >> cathay_balance.txt; echo $BALANCE | /usr/bin/mail -s "SUBJECT" "EMAIL"

This will check the balance and save it into a file called `cathay_balance.txt`, as well as sending an email to a specified address, all that every day at 23:55 at night.

## Dependencies

 * Python 2.7.x
 * BeautifulSoup4

## WARNING

 If you are modifying this, make sure you are not checking in your sensitive information into
 git by accident!

## License

Copyright (C) 2013 Gergely Imreh <imrehg@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
