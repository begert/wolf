url="http://api.wolframalpha.com/v2/query"
appid="836KP6-46P3RVK7A2"
query="$@"
value="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$query")"

echo "Computing: $query"

curl -s -L -G -d "input=$value&appid=$appid&format=plaintext" $url >/tmp/wolfram-alpha.xml

xsltproc ~/Projects//wolf/wolf.xslt /tmp/wolfram-alpha.xml

rm /tmp/wolfram-alpha.xml

echo "https://www.wolframalpha.com/input/?i=$value"
