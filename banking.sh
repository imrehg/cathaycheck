
echo "Credentials into ID/PIN/CODE"

URL1=https://www.mybank.com.tw/pweb/
URL2=https://www.mybank.com.tw/pweb/login.asp
URL3=https://www.mybank.com.tw/pweb/main_menu.asp
URL4=https://www.mybank.com.tw/pweb/main_menu_bottom.asp
URL5=https://www.mybank.com.tw/pweb/C01.asp

USERAGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17"

# main page to get cookie
curl \
     --silent \
     --location \
     --user-agent "${USERAGENT}" \
     -b cookies.txt \
     -c cookies.txt \
     ${URL1}

# logging in
curl \
     --silent \
     --location \
     --user-agent "${USERAGENT}" \
     -b cookies.txt \
     -c cookies.txt \
     --referer ${URL1} \
     --data "logon_name=${ID}&logon_pwd=${PIN}&nick_name=${CODE}&ChipCard=N&ComeFrom=MyBank&Fun=&wid=&wp_kind=&FundID=&FundType=&ClickFlag=&capslock_status=&kbdid=" \
     ${URL2}

# menu page
curl \
     --silent \
     --location \
     --user-agent "${USERAGENT}" \
     -b cookies.txt \
     -c cookies.txt \
     --referer ${URL2} \
     ${URL3}

# menu side
curl \
     --silent
     --location \
     --user-agent "${USERAGENT}" \
     -b cookies.txt \
     -c cookies.txt \
     --referer ${URL3} \
     ${URL4}

# actual data
curl \
     --location \
     --user-agent "${USERAGENT}" \
     -b cookies.txt \
     -c cookies.txt \
     --referer ${URL4} \
     ${URL5} > url5.html

./parsing.py url5.html
