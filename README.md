
***
## Understanding *Signals*

Trying to use the Godot game engine programmatically as much as possible

With that in mind, I needed to understand how *signals* work in Godot. So this demo project tries to demonstrate how signals work

The project is organized as:

- Main
  - Parent
      - Child0
      - Child1


One of my primary issues was that the node `Child0` could not connect or communicate with the node `Child1`. The issue was my misunderstanding of how scripts are attached to the Godot nodes versus a POSIX style file system. 

In short  the scripts are contained *inside* of the nodes

- Main
  - *Main.gd*
  - Parent
    - *Parent.gd*
      - Child0
        - *Child0.gd*
      - Child1
        - *Child1.gd*

Even though every file could be in the same directory of your operating system. Godot does not see it that way and therefore to navigate from the node `Child0` to `Child1` you cannot not use the `./` or *current directory* path designator, instead you would need to use the `../` or *parent directory* path designator.


#### Child1.gd [receiver]
```
var path=get_node("../Child0")
var msg = yield(path , "Test")
print(msg + " From Sibling[Child1] of Child0")
```
#### Child0.gd [emitter]
```
emit_signal("Test","a bit of data")
```


***
## Real World Usage of *Signals*

However, in the end this is moot for as larger projects where you would use a *controller* or intermediary of sorts to connect or direct signals properly. To use an older analogy of a telephone switchboard, a viable control system could look like this:


- Main [*Global telephone network*]
  - Parent [*Local switchboard operator*]
      - Child0 [*Person making the call*]
      - Child1 [*Person receiving the call*]



Breakdown:
- `Child0` dials a telephone number [Godot script emits a signal] 
- The switchboard `Parent` routes the call [the signal] made by `Child0` to `Child1`  
- `Child1` accepts [connects] the call from `Child0`



***
Thanks to the people on the Godot Discord for helping me understand this.