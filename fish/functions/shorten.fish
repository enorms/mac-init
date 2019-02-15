function shorten
    set --local API_URL https://api-ssl.bitly.com/v4/shorten
    set --local HEADER "Authorization:Bearer $BITLY_API_TOKEN"
    set --local LONG_URL $argv[1]
    set --local RESPONSE (http --body POST $API_URL $HEADER long_url=$LONG_URL domain=bit.ly)
    set --local SHORTENED_URL (echo $RESPONSE | jq --raw-output '.id')
    echo $SHORTENED_URL | pbcopy
    echo $SHORTENED_URL coppied to clipboard!
end
