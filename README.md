BashMail
===

Usage
---
Send an email

```sh
$ email "recipient@email.com" "subject line here" "email content here"
```

Receive your recent gmail

```sh
$ gmail
```

Output for `gmail` appears as such:

```sh
$ gmail

blackdiamond@blackdiamondequipment.com   Alpine Start Hoody: Featherweight Softshell
info@rockthevote.com                     Madonna, President Clinton, Lena Dunham, and you?
hackers@docker.com                       Docker Weekly: October 22nd, 2014
amang@fluidware.com                      FluidSurveys Follow-up
noreply@podio.com                        Podio Daily Digest
no-reply@lyftmail.com                    Thanks for riding with jiawei
pulak@ycombinator.com                    How to Raise Money - Lecture 9
...

```

Rejoice!  Now you can have spam in your terminal!

If you have a lot of spam, you should consider having it dictated to you:

```sh
$ gmail | say
```

Config
---
Set your gmail username and password as environment variables to receive
your gmails and to be bcc'd on any sent emails

```sh
$ export GMAIL_ADDRESS="myusername@gmail.com"
$ export GMAIL_PASSWORD="mypassword123"
```

Installation
---
Download the code

```sh
$ git clone https://github.com/NathanielWroblewski/bashmail.git
```

Move the executables within your `$PATH`

```sh
$ sudo mv ./bin/{g,e}mail /usr/bin
```

You may have to modify the files so they are executable

```sh
$ chmod a+x /usr/bin/gmail
$ chmod a+x /usr/bin/email
```

Dependencies
---
[cURL](http://curl.haxx.se/)
