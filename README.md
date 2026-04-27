# Pong

### Project Overview 
A Simple Pong game implemented using LÖVE and written in Lua. Game represents the retro pong game that allows the user to engage in playing both Single and Multi player modes.

<img width="1392" height="860" alt="image0" src="https://github.com/user-attachments/assets/c4c0cc28-6f1c-4a2b-8433-37443058c5c9" />

In Single player mode the player get to play with a automated player. While two players can engage in Multi player mode.

<img width="1392" height="860" alt="image1" src="https://github.com/user-attachments/assets/38c50690-373a-466a-8dbc-2074b936c6bb" />

### Features
- Two different gaming modes
- Retro UI
- Retro sound effects for collision


### Tech Stack
- Language: Lua
- Framework: LÖVE


### Folder Overview
- `main.lua`: Contains the main controller of game and the logic behind the game
- `Ball.lua`: Contains the Ball object
- `Paddle.lua`: Contains the Paddle object
- `class.lua`: Class library written by [Matthias Richter](https://github.com/vrld/hump/blob/master/class.lua)
- `push.lua`: Contains library written by [Ulysse Ramage](https://github.com/Ulydev/push/blob/master/push.lua)
- `/audio`: Contains all the audio files
- `/fonts`: Contains all the font files


### Getting Started

#### Prerequisites
- Check whether if you have installed LÖVE, if not you can install it by visiting [here](https://love2d.org).

#### Installing
- Clone the git hub repository to your local pc.
```
git clone https://github.com/ChamalInd/Pong.git
```

#### Running the Game
- Drag and drop the cloned project folder to the love app icon.

### How to Play
- In Single Player mode, use ```W``` and ```S``` to controll the paddle.
- In Multi Player mode, Player 01 can use ```W``` & ```S``` to move while Player 02 can use ```Up``` and ```Down``` arrow keys.
