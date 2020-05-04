# Pausing
A template for pausing your game.

## Getting Started
### Requirement
* Godot Engine v3.2+

### Installation
After downloading, open Godot Engine Project Manager. Click Import, go to the folder you've downloaded into, and select "project.godot".

## Usage
### Opening the Project
The editor shows a spinning gear; its animation is resulted by its child node, AnimationTree. Play (F5) the project, and the gear on the new screen should still be spinning. To temporally stop the gear, pause the game. You can do so by clicking on the pause button on the top-left hand corner, or press Esc on the keyboard, which is its key shortcut.

On the pause screen, you can move your mouse to click on one of the buttons, or navigate with arrow keys. Click on them to unpause, or quit (confirmation panel will appear first).

### How it Works
The "\pause_assets" folder has the following files:

#### PauseBg.gd
PauseBg handles all pause screen functions such as continuing the game and switching panels. It has `np_panels`, an Array of NodePaths that lists the menu panels it has.

Using the Control Node ColorRect sounds ideals as its color can be directly set in the Inspector, but in projects using more than one scenes, Panels' styles can be shared across a single theme.

#### PauseRes.tres
This resource file handles the style of the whole pausing system.

#### MenuPanel.gd
MenuPanel lists the buttons it has, connecting them to its parent PauseBg when it comes to pressing. This is done through a Dictionary, `button_effects`.
In the Inspector, you can add its buttons' NodePath as a key. The value can be either a NodePath of another menu panel, or the following Strings:
* _continue_game
* _quit_game

If a NodePath is stored as a value, the pause background will switch to the respective panel. The first button gets focused.

### Applicability
To make use of this asset, copy "\pause_assets" to your project folder.

On the Scene dock, add a CanvasLayer. From there, +Add Child Node (Panel) and attach script "PauseBg.gd" to it. Next, add all the Panel Containers needed as children of the Panel, and attach script "MenuPanel.gd" to each of them. In the pause background panel's Inspector, add all the menu panels' NodePaths to `np_panels`. Finally, add all children node buttons to their respective menu panels.

You can add any container nodes in-between to adjust the pause screen layout, as long as all menu panels are part of children nodes of the pause background, and the buttons are part of the children nodes of their respective menu panels. You can also stylize the background, menu panels and buttons by going adding a Theme in the pause background panel's Inspector. 

Update pause background's `np_panels` with all the menu panels under it, while for each menu panels, add its buttons' NodePaths as keys and fill their respective effects as values.

#### Tips
Finalize the layout of the menu panels before adding their buttons and their effects to `button_effects`. The NodePath key does not get updated automatically when the buttons are reparented in the process.

## Potential Updates

### Major
* Impliment options for
  * Visual
    * Quality
    * Screen Size
  * Adjusting volume for BGM and SFX

### Minor
* Button style: Just text with arrow pointing at it when focused.
* Take account to a key button having wrong NodePath or missing value.

### Bugs to Fix
* Improper focusing when mouse hovers over a button.

## Author
* mechPenSketch

## License
(to be added)
