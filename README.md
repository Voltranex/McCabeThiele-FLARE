# FLARE | McCabe-Thiele method performer developed on MATLAB
![alt text](https://cdn.discordapp.com/attachments/861530555715682304/884040839750381578/scd.PNG)

FLARE is open source McCabe-Thiele method performer designed on MATLAB App Designer and compatible with R2016a and above MATLAB versions. Also with .exe file FLARE can be used without MATLAB installed.

Features

-Works with both database and user defined equilibrium values 

-500 component database

-Fast response for different design parameters

-Easy to understand error panel

-With or without minimum stage number calculations

On the database tab two components are selected from drop-down menus. For user defined tab xA and yA  equilibrium values defined with space.
After that on the left side of the app McCabe-Thiele method parameters such as feed condition, bottom fraction(xB), top fraction (xD) and feed composition (xF)
and reflux ratio values should be added in order to perform McCabe-Thiele method.

xA - yA equilibrium values calculated using the combination of Antoine equation and Raoult's law from Database
![alt text](https://cdn.discordapp.com/attachments/861530555715682304/884041877492473856/database.PNG)

xA - yA values defined by user
![alt text](https://cdn.discordapp.com/attachments/861530555715682304/884041860933382175/userdefined.PNG)

Error panel
![alt text](https://cdn.discordapp.com/attachments/861530555715682304/884043849012477952/errorpanel.PNG)

About section
![alt text](https://cdn.discordapp.com/attachments/861530555715682304/884041869380710480/about.PNG)

[Download links](https://github.com/Voltranex/McCabeThiele-FLARE/releases)

# Old version runs on MATLAB Editor

This MATLAB script allows 2 main features. One of them is using excel database to draw boiling point curve and equilibrium diagram of binary components using the combination of Antoine equation and Raoult's law. Second methods is takes the xA, yA equilibrium values from user to draw equilibrium diagram. 
After equilibrium diagram drawn, the second script called graphandler.m performs McCabe-Thiele method to calculate theorotical stage number, minimmum stage number and minimum reflux ratio graphically. Just run the mcCabeThiele.m file,

Here is the example of usage:

Choosing the method

![alt text](https://media.discordapp.net/attachments/861530555715682304/861530604251250698/Screenshot_1.png)

# Method a (From database)
Number of the components choosen from component list.pdf (500 compounds) than pressure of the system is defined.

Here is the BENZENE Example
![alt text](https://cdn.discordapp.com/attachments/861530555715682304/868614432266264636/unknown.png)

![alt text](https://media.discordapp.net/attachments/861530555715682304/861530992593862656/Screenshot_2.png)

Here is the output of the Benzene and Toluen binary mixture;
<a href="https://github.com/Voltranex/McCabeThiele/edit/main/README.md">
  <img align="left" src="https://media.discordapp.net/attachments/861530555715682304/862984125496557568/antonie.png" />
</a>
<a href="https://github.com/Voltranex/McCabeThiele/edit/main/README.md">
  <img align="center" src="https://media.discordapp.net/attachments/861530555715682304/861531661027246080/Antoniexaya.png" />
</a>

McCabeThiele method option;
![alt text](https://cdn.discordapp.com/attachments/861530555715682304/861532957638262814/Screenshot_4.png)

![alt text](https://cdn.discordapp.com/attachments/861530555715682304/861532966852886528/Screenshot_5.png)

Here is the results of  McCabeThiele method

![alt text](https://media.discordapp.net/attachments/861530555715682304/861532872711864330/McCabe-Thiele.png)

Red lines represents theorotical stage number, dashed black line is feed line and the black line represents minimum stage number.

![alt text](https://cdn.discordapp.com/attachments/861530555715682304/861532965933547520/Screenshot_6.png)


# Method b (From user given data)
![alt text](https://media.discordapp.net/attachments/861530555715682304/861534004251197490/Screenshot_7.png)

xA, yA values must be an array as shown below.
![alt text](https://media.discordapp.net/attachments/861530555715682304/861534005584592927/Screenshot_8.png)
Here is the output without McCabeThiele method
![alt text](https://media.discordapp.net/attachments/861530555715682304/861535485864050698/untitled.png)

Example of q defined feed condition;
![alt text](https://media.discordapp.net/attachments/861530555715682304/861534006813917184/Screenshot_9.png)
![alt text](https://media.discordapp.net/attachments/861530555715682304/861534008441176084/Screenshot_10.png)
![alt text](https://media.discordapp.net/attachments/861530555715682304/861534009438896188/Screenshot_11.png)

Here is the results of  McCabeThiele method
![alt text](https://media.discordapp.net/attachments/861530555715682304/861535278555856896/McCabe-Thiele.png)

Red lines represents theorotical stage number, dashed black line is feed line and the black line represents minimum stage number.
![alt text](https://media.discordapp.net/attachments/861530555715682304/861536391195262976/Screenshot_13.png?width=953&height=188)

# Update V-0.1 | 25.07.2021

Now user make a choice about to on/off mode of Minimum stage calculation.
Here is the example of McCabe–Thiele method without minimum stages

![alt text](https://cdn.discordapp.com/attachments/861530555715682304/868619362028884010/McCabe-Thiele.png)

Thank you for your time, for any suggestion or possible bug contact with me via e-mail or pull a request.











