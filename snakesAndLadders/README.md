## Snakes&Ladders

This is my first 'study' project in Swift, which I've done after completing about a half of the official Apple's The Swift Programming Language to practise my skills. It is a simple game in which you roll dice to move two chips through the game field. The chips move by the number on the dice horizontally and vertically. However, there are shortcut vectors ('snakes' and 'ladders') which allow the chip to move along the direction of the vector.

A screenshot of the game is in `screenshot.png`.

## Notes on Development

The game field represents a 10x10 grid, and the x-,y- coordinates are stored in two arrays embedded in the tuple. The coordinates are computed based on the corresponding UIView's attributes, and the grid's size can be adjusted. The players' views are two UIViews which are embedded in the game field, and they can move in it by changing their coordinates in the grid according to the rules of the game. The proper trajectories are computed using basic arithmetics. 

The Model is implemented in `GridTools.swift` and `Player.swift` . The first file contains functions to generate the grid and to get a coordinate by a cell number (all the cells are numbered 0-99: 0-9 in the first row from right to left, 10-19 in the second row from left to right, 20-29 in the thrid row from right to left, etc.). The second one contains a Player structure to store the players' current positions.

The View is a single UIView in the `Main.storyboard` and UIViews embedded in it. The images and resources are in the `images` folder. All the visusal assets are created by me using Microsoft PowerPoint for drawing, except for the dice icon, which was taken from [flaticon.com](https://www.flaticon.com), and was originally created by [Dimi Kazak](https://www.flaticon.com/authors/dimi-kazak).

The Controller is a single UIViewController which manages this UIView, and which is implemented in `ViewController.swift`. The view controller manages the calculation and animation of the movements, and the game cycle (restart, finish, update info, etc.)

## What I Learned & Technologies Used

- How **autolayout constraints** work.
- How **UIView's `animateWithDuration:animations:completion:`** method works.
- More on **class properties**, **structures** and **mutating functions**.
- How to orginise the project according to the **MVC approach** (although, there's still much to learn).
- How **.swift files communicate** with each other.
- How to represent a mathematic grid in programming. How to operate with coordinates.
- How to use `Color Literal` to simplify work with colors.
- How to manage project's attributes (name, device, etc.)
- How to create simple visuals for the project.
