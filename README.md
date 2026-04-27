# Pong

### Project Overview 
A Simple Pong game implemented using LÖVE and written in Lua. Game represents the retro pong game that allows the user to engage in playing both Single and Multi player modes.

![Home Page](ss/image0.png)

In Single player mode the player get to play with a automated player. While two players can engage in Multi player mode.

![Single Player](ss/image1.png)

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
