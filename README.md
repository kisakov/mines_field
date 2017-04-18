# MinesField

Coding exercise for CrowdFlower.com

## Description

There is a field of mines. Each mine is identified by a 2d-coordinate and a blast radius. When a mine explodes at time interval t, it explodes mines that lay within its blast radius at t + 1.

Given a list of mines consisting of their X & Y coordinates and blast radius (ex 2, 2, 5), write a program that finds which mine(s) in the list trigger the greatest number of explosions. Use the Euclidean distance to determine whether a mine lays within the radius of another mine. Your program should produce an output file showing the mines, identified by their coordinates & blast radius, in descending order of total generated explosions.

A sample mines files is located in the root with name "example_mines.txt".

## Installation

Go to the gem's directory and then execute:

    $ bundle

## Usage

Go to the gem's directory.

There are two ways on how to use the program.

Option 1.
Reads mines from "example_mines.txt" file which should be located in the root of gem.
Produces an output file "example_output.txt" which will be located in the root of gem.

    $ bin/mines_field_example

Option 2.
For stdin provide the list of mines from file or like a string.
Stdout can be written to the file or be displayed on the screen.

    $ cat example_mines.txt | bin/mines_field > example_output.txt
    $ echo "1 1 1 \n 2 2 3" | bin/mines_field

