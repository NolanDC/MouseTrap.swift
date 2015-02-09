MouseTrap.swift is a Swift version of the popular [mousetrap.js](https://github.com/ccampbell/mousetrap) library for use in OSX development. MouseTrap.swift allows you to easily bind custom handlers to NSEvent keyboard events.

## Installation
I am currently new to the Swift / XCode development environment, and am figuring out a more official way to package this library. For now, just copy the MouseTrap.swift file into your project.

## Usage
MouseTrap has an easy to use API:

```
var mouseTrap = MouseTrap()
mouseTrap.bind("command shift f", handler: { () -> Void in
  println("user has pressed command+shift+f!")
})
```

To unbind an event, use the `unbind` method with the same keys you passed to `bind`:

```
var mouseTrap = MouseTrap()
mouseTrap.unbind("command shift f")
```

## Limitations
MouseTrap.swift is not a complete implementation. Currently it uses `NSEvent.addLocalMonitorForEventsMatchingMask` to capture events, which will only work when your application has focus. There are plans to change this (and Pull Requests are always welcome!).
