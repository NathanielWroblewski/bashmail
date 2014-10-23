#!/bin/bash

# Fetches recent incoming emails from gmail and formats them
# Usage: $ gmail
gmail() {
  if [ -z "$GMAIL_ADDRESS" ] || [ -z "$GMAIL_PASSWORD" ]
  then
    echo 'Set your email and password.'
    echo '`$ export GMAIL_ADDRESS=<me@gmail.com>`'
    echo '`$ export GMAIL_PASSWORD=<mypassword123>`'
  else
    echo ''
    curl -u $GMAIL_ADDRESS:$GMAIL_PASSWORD                                 \
      --silent "https://mail.google.com/mail/feed/atom"                  | \
      xpath '//feed/entry/author/email | //feed/entry/title' 2>/dev/null | \
      sed -e 's/<email>\([^\<]*\)<\/email>/;;;\1###/g'                   | \
      sed -e 's/<title>\([^\<]*\)<\/title>/\1/g'                         | \
      sed -e 's/\(.*\);;;\([^(###)]*\)/;;;\2###\1/g'                     | \
      tr ';;;' '\n'                                                      | \
      column -t -s '###'
    echo ''
  fi
}

# Sends an email from the Command Line
# Usage: $ email "blah@blah.com" "Subject line" "Content of email"
email() {
  if [ -z "$1" ] || [ -z "$3" ]
  then
    echo 'Set an address to send to, subject line, and content.'
    echo '`$ email "boom@pop.com" "Subject Line" "Content of Email"`'
  else
    TO="$1"; SUBJECT="$2"; BODY="$3"
    echo "$BODY" | mail -b "$GMAIL_ADDRESS" -s "$SUBJECT" "$TO"
  fi
}
