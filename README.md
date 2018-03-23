# sudoku-app
A mobile app implementation of the popular sudoku game for iOS devices

Name: Grant Lindberg
Email: grant.lindberg@wsu.edu
Date: March 23, 2018

Project: Sudoku
Description: This is a mobile implmentation of the popular game, Sudoku for iOS devices.

How to play:

From the main menu, select either a new simple game or a new hard game. While playing, the user is given a series of controls as explained below:

1-9 buttons:

If penciling mode is off:

Insert a value into the selected square on the board. If the same value is already in that square, the space will be cleared; otherwise if a different value is already in that square, a new value cannot be placed until that square is cleared. Any penciled in values will be overwritten. If the inserted value conflicts with any other value in the same row, column, or 3x3 square, the value will be red; otherwise it will be blue.

If penciling mode is off:

Pencil in values into the selected square on the board. Multiple values can be penciled into one square. If you select a value that is already in the square, that value will be cleared.

Pencil button:

Toggle penciling mode on or off.

Clear cell button:

Clears the value in the selected cell on the board

Menu:

Opens up an action sheet with two options:

Clear conflicting cells:

Clears all cells on the board that conflict with other cells on the board i.e. clears all cells with a red coloring. Note that this does not include any values that have been penciled in.

Clear all cells:

Clears all cells on the board that the user has inserted. Note that this does include any penciled in values.

NOTE: This implementation does not have the ability to save or load the state of the game
