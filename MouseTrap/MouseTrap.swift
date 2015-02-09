//
//  MouseTrap.swift
//
//  Created by Nolan Carroll on 2/8/15.
//  Copyright (c) 2015 Nolan Carroll. All rights reserved.
//

import Foundation
import Cocoa

class MouseTrap {
    
    var pressedKeys = [String : Bool]()
    
    init() {
        NSEvent.addLocalMonitorForEventsMatchingMask(NSEventMask.KeyDownMask, handler: keyDown)
        NSEvent.addLocalMonitorForEventsMatchingMask(NSEventMask.KeyUpMask, handler: keyUp)
    }
    
    func keyDown(event: NSEvent!) -> NSEvent! {
        if let char = event.characters {
            self.pressedKeys[char] = true
        }
        return event
    }
    
    func keyUp(event: NSEvent!) -> NSEvent! {
        if let char = event.characters {
            self.pressedKeys.removeValueForKey(char)
        }
        return event
    }
    
    func modifiers(event: NSEvent!) -> [String] {
        var mods = [String]()
        
        if (event.modifierFlags & NSEventModifierFlags.CommandKeyMask) != nil {
            mods.append("command")
        }
        
        if (event.modifierFlags & NSEventModifierFlags.ShiftKeyMask) != nil {
            mods.append("shift")
        }
        
        if (event.modifierFlags & NSEventModifierFlags.FunctionKeyMask) != nil {
            mods.append("function")
        }
        
        return mods
    }
    
    func allKeysForEvent(event: NSEvent!) -> [String] {
        return pressedKeys.keys.array + modifiers(event)
    }
    
    // Calls the handler method when the
    func bind(keys: String, handler: () -> AnyObject?) {
        
    }
    
    // Unbinds all handlers attached to the specified key combo
    func unbind(keys: String) {
        
    }
}