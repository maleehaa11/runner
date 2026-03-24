# runner

**User & System Requirements with Scrum Stories **

**1.1 User Requirements**

The player must be able to move the runner smoothly through the maze.
The player must receive immediate feedback when colliding with hazards.
The player must see their score, stamina, and speed clearly on the HUD.
The player must experience increasing difficulty over time.
The player must feel urgency due to collapsing environments and unseen threats.

**1.2 System Requirements**

- The system must generate or load maze segments seamlessly.
- The system must detect collisions accurately (walls, traps, falling debris).
- The system must scale speed and difficulty dynamically.
- The system must run at a stable 30–60 FPS.
- The system must handle keyboard input with low latency.

**1.3 Scrum‑Style User Stories**

- As a player, I want to move left/right/forward so I can navigate the maze.
- As a player, I want obstacles to appear unpredictably so the game feels challenging.
- As a player, I want visual and audio feedback when I take damage or fail.
- As a player, I want the environment to collapse behind me so I feel urgency.
- As a player, I want my score to increase the longer I survive.
- As a designer, I want modular level segments so I can test different maze patterns.
- As a developer, I want clean collision logic so the game behaves consistently.

***2. scrum backlog - definitions and tests***

**2.1 product backlog**


| priority  | feature | description | definition of done | test criteria |
| --------- | ------- | ----------- | ------------------ | ------------- |
| high   | player movement  | 3-direction movement  | smooth, responsive, no delay/lag  | player moves correctly  |
| high  | player animation  | player running, sliding, jumping  | correct animations responsive to each instruction  | animations correct  |
| high  | speed scaling | game speeds up overtime  | difficulty surve implemented  | speed increases every 10 second  |
| medium  | HUD  | score,speed  | UI updateable  | score increases  |
| medium  | environment collapse  | world ends behind player  | ends  | player cannot backtrack  |
| low  | sound design  | footsteps, coin pickup  | sounds implemented  | trigger at correct events |
| medium  | chaser  | unseen force  | visiual/audio cues  | player dies if too slow  |
| medium  | restart system  | restart option once player dies  | screen shows restart option at death  | game restarts  |

***Detailed design, Development and Implementation***

**3.1 Core Game Concept**

Runner is a fast paced, adrenaline-driven endless runner set inside collapsing stone mazes and industrial ruins. The player must escape shifting paths while being chased by an unseen force. The game emphasizes reflexes, pattern recognition, and high-pressure decision-making.

**3.2 Game Story**

The player awakens inside a massive, ancient labyrinth. The walls shift, and something hunts them from the shadows. Their only goal: run. As the player survives longer, the environment reveals symbols and markings hinting at a forgotten civilization and the reason the maze exists.

**3.3 Characters**

•	The Runner
-	Human silhouette with simple but expressive animations
-	Outfit: reinforced gear 
-	Represents determination and survival instinct
•	The Unseen Force
-	Never fully shown
-	Represented through:
-	Screen shake
-	Red warning lights
-	Distant roars
-	Darkness creeping in

**3.4 Environments**

Themes
-	Giant stone mazes
-	Crumbling corridors
-	Industrial ruins
-	Elevated platforms over fog or darkness

Visual Style
-	Semi-realistic
-	Muted dystopian palette:
- Concrete grey
-	Dusty brown
-	Warning red/orange

Environmental Hazards
-	Collapsing floors
-	Maze blocks to enforce one route out

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

-	Player State: Running, stressed, focused
-	Need: Escape, survive
-	Challenge: Increasing speed + unpredictable hazards
-	Reward: Score, gear upgrades, mastery
-	Failure: Instant death → restart → try again

**3.6 Game Rules**

-	One hit = death (unless shield power-up added later)
-	Player cannot move backwards
-	Maze collapses after a fixed delay
-	Speed increases every 10 seconds
-	Score = time survived × speed multiplier

**3.7 Programming Language & Platform**

-	Godot 4.6
-	GDScript (Python-like, ideal for rapid prototyping)
-	Target: Desktop prototype, mobile-ready controls

**3.8 User Interface & Controls**
Controls

-	Left Arrow: Move left
-	Right Arrow: Move right
-	Space: Jump
-	Down Arrow: Slide
HUD

-	Score

**3.9 Technical Challenges**

-	Smooth obstacle generation
-	Avoiding stutter when loading segments
-	Accurate collision detection at high speeds
-	Implementing collapse timing without lag
-	Balancing difficulty scaling
-	Ensuring mobile-friendly input mapping
-	Importing player with correct animations
-	Ensuring animations work with correct buttons


**3.10 Test Plan**

Test Objectives
The purpose of this test plan is to verify that:

- All core gameplay mechanics function correctly
- The game meets user and system requirements
- Animations, controls, and collisions behave consistently
- Performance remains stable during gameplay
- The game is enjoyable, readable, and responsive

Test Types
1. Unit Tests
Tests individual components such as:

- Movement logic
- Jump and slide functions
- Collision detection
- Score updates
- Speed scaling

2. Integration Tests
Ensures systems work together:

- Player + obstacles
- Player + pickups
- Player + environment collapse
- AnimationPlayer + movement states
- UI + scoring system

3. Performance Tests
Checks:

- FPS stability (target 30–60 FPS)
- No stutter when loading maze segments
- Smooth animation playback

4. User Tests
Evaluates:

- Control responsiveness
- Difficulty curve
- Readability of UI
- Player experience

**3.11 Test Plan Table**

| test ID  | feature | description | expected result | actual result | 
| --------- | ------- | ----------- | ------------------ | ------------- |
| T01   | lane movement  | left/right to change lanes  | player moves smoothly  |  works as expected |
| T02  |  jump | space to jump  |  player jumps |  works as expected |
| T03  | slide  | down to slide  | player slide + animation plays  |  works as expected |
| T04  | pickup collection  |  touch pickup (coin) |  pickup disappears + score increased |  works as expected |
| T05  | speed scaling  | survive longer = speed increase  | player speed increases  |  works as expected |
| T06  | environment collapse  | stand still  | collapse catches player = death  | works as expected  |
| T07  |  animation switching |  perform actions |  correct animation for each state |  initial issues using AnimationTree, fixed using AnimationPlayer |
| T08  |  restart system |  press restart button |  game restarts |  works as expected |
| T09  | input latency  |  press movement keys |  immediate response | works as expected  |
| T10  | UI updates  | score increases overtime  | UI updates every frame  |  works as expected |


***4 Project Planning, Management & Documentation***

**4.1 Burndown Chart**

<img width="751" height="452" alt="image" src="https://github.com/user-attachments/assets/993c3c7c-6e3f-4731-8382-97c7eb115681" />

The burndown chart tracks 18 total tasks over a 4‑week sprint. The ideal burndown line decreases linearly from 18 to 0 tasks. The actual burndown line shows consistent weekly progress: 14 tasks remaining in Week 1, 10 in Week 2, 6 in Week 3, and 0 by Week 4. Weekly notes document completed work, blockers, and next steps. The chart demonstrates effective sprint management, backlog adaptation, and steady progress toward project completion

**4.2 Weekly Meeting Logs**

Meeting 1

- First session: implement basic movement
- Next: add world and obstacles
- Problems: player not moving smoothly

Meeting 2

- Since last session: player moved smoothly across lanes, added world and obstacles (jump and slide)
- Next: implement speed scaling and death by falling off world
- Problems: collision with sliding obstacle

Meeting 3

- Since last session: fixed collision, added speed scaling + UI for start up and death and pickup objects
- Next: implement try again button and restart, scoring and 3d character with animations
- Problems: objects wouldnt disapper when picked up

Meeting 4

- Since last session: objects disapper when picked, restart button and scoring implemented, 3d player with animations added
- Next: add environment, make objects look like walls/mazes focus more on UI
- Problems: struggled with animations linking to player - sorted using AnimationPlayer

***5. Software Tools & Coding Techniques (5%)***

**Tools Used**
-	Godot 4 Engine
-	GDScript
-	Mixamo (sprites + animations)
-	GitHub (version control)

***6. Completion & Testing Against Requirements (15%)***

**Verification**

-	All core mechanics implemented
-	Player movement responsive
-	Obstacle segments load correctly
-	Speed scaling works
-	HUD updates in real time
- Game meets user/system requirements

**Validation**

Playtesting confirms:
-	Difficulty increases smoothly
-	Visual feedback is clear
-	Controls feel intuitive
-	Performance stable





























