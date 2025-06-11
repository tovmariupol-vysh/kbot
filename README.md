# kbot
### DevOps application from scratch

The project was developed to study the possibility of interaction with a Telegram bot.
During the development of the program, the bot is used:
t.me/olehtyshchenko_bot

How to use:
1. Create a bot in Telegram
1.1 Find "BotFather" in Telegram.  There is a bot that helps you create your bot.
1.2 Creating a new bot
1.2.1 Execute the "/newbot" command
1.2.2 Enter the name of the bot. For example, kbot
1.2.3 Enter a username for your bot. For example FirstnameLastname_bot
1.2.4 Save the received token
2. Clone the repository
3. Set Telegram's token as an environment variable. For example,
 read -s TELE_TOKEN   
 ctrl-v
4. Check the value of the variable and export it
 echo $TELE_TOKEN
 export TELE_TOKEN 
5. Start the program with the parameter "start" from the repository directory 
If the connection to the bot is successful, you will see the following message:
kbot v1.0.2 started
6. Start your bot in Telegram
7. Test  the program
Type the following command in Telegram's bot
 /start hello

If the operation is successful, you will see the following message:
Hello, I'm kbot v1.0.2!
