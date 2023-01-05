Trying to use the Godot game engine programmatically as much as possible

With that in mind, I needed to understand how *signals* work in Godot. So this demo project tries to demonstrate how signals work

The project is organized as:

- Main
  - Parent
      - Child0
      - Child1


One of my primary issues was that the node `Child0` could not connect or communicate with the node `Child1`. The issue was my mis-understanding of how scripts are attached to the Godot nodes versus the a file system. 

In short  the scripts are contained *inside* of the nodes

- Main
  - *Main.gd*
  - Parent
    - *Parent.gd*
      - Child0
        - *Child0.gd*
      - Child1
        - *Child1.gd*

Even though every file could be in the same directory of your operating system. Godot does not see it that way and therefore to navigate from the node `Child0` to `Child1` you would not use the `./` or *current directory* path designator, instead you would need to use the `../` or *parent directory* path designator.
