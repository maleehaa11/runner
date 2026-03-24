# runner

**User & System Requirements with Scrum Stories **

**1.1 User Requirements**

The player must be able to move the runner smoothly through the maze.
The player must receive immediate feedback when colliding with hazards.
The player must see their score, stamina, and speed clearly on the HUD.
The player must experience increasing difficulty over time.
The player must feel urgency due to collapsing environments and unseen threats.

**1.2 System Requirements**

The system must generate or load maze segments seamlessly.
The system must detect collisions accurately (walls, traps, falling debris).
The system must scale speed and difficulty dynamically.
The system must run at a stable 30–60 FPS.
The system must handle keyboard input with low latency.

**1.3 Scrum‑Style User Stories**

As a player, I want to move left/right/forward so I can navigate the maze.
As a player, I want obstacles to appear unpredictably so the game feels challenging.
As a player, I want visual and audio feedback when I take damage or fail.
As a player, I want the environment to collapse behind me so I feel urgency.
As a player, I want my score to increase the longer I survive.
As a designer, I want modular level segments so I can test different maze patterns.
As a developer, I want clean collision logic so the game behaves consistently.

***2. scrum backlog - definitions and tests***

**2.1 product backlog**


| priority  | feature | description | definition of done | test criteria |
| --------- | ------- | ----------- | ------------------ | ------------- |
| high   | player movement  | 3-direction movement  | smooth, responsive, no delay/lag  | player moves correctly  |
| high  | player animation  | player running, sliding, jumping  | correct animations responsive to each instruction  | animations correct  |
| high  | speed scaling | game speeds up overtime  | difficulty surve implemented  | speed increases every 1.0 second  |
| medium  | HUD  | score,speed  | UI updateable  | score increases  |
| medium  | environment collapse  | world ends behind player  | ends  | player cannot backtrack  |
| low  | sound design  | footsteps, coin pickup  | sounds implemented  | trigger at correct events |
| medium  | chaser  | unseen force  | visiual/audio cues  | player dies if too slow  |
| Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |

***Detailed design, Development and Implementation***

**3.1 Core Game Concept**

Runner is a fast paced, adrenaline-driven endless runner set inside collapsing stone mazes and industrial ruins. The player must escape shifting paths while being chased by an unseen force. The game emphasizes reflexes, pattern recognition, and high-pressure decision-making.

**3.2 Game Story**

The player awakens inside a massive, ancient labyrinth. The walls shift, and something hunts them from the shadows. Their only goal: run. As the player survives longer, the environment reveals symbols and markings hinting at a forgotten civilization and the reason the maze exists.

**3.3 Characters**

•	The Runner
o	Human silhouette with simple but expressive animations
o	Outfit: reinforced gear 
o	Represents determination and survival instinct
•	The Unseen Force
o	Never fully shown
o	Represented through:
	Screen shake
	Red warning lights
	Distant roars
	Darkness creeping in

**3.4 Environments**

Themes
•	Giant stone mazes
•	Crumbling corridors
•	Industrial ruins
•	Elevated platforms over fog or darkness

Visual Style
•	Semi-realistic
•	Muted dystopian palette:
o	Concrete grey
o	Dusty brown
o	Warning red/orange

Environmental Hazards
•	Collapsing floors
•	Maze blocks to enforce one route out

**3.5 Gameplay**

Gameplay Loop

1.	Player runs forward
2.	Maze generates ahead
3.	Environment collapses behind
4.	Player avoids hazards
5.	Speed increases
6.	Player eventually fails
7.	Score recorded → restart

Motivation Loop

•	Player State: Running, stressed, focused
•	Need: Escape, survive
•	Challenge: Increasing speed + unpredictable hazards
•	Reward: Score, gear upgrades, mastery
•	Failure: Instant death → restart → try again




























