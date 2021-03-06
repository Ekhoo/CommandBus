//
//  CommandHandler.swift
//  CommandBusExample
//
//  Created by Lucas Ortis on 09/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

import Foundation

public class CommandHandler {
    
    let commandHandledEvent: String?
    
    required public init(commandHandledEvent: String?) {
        self.commandHandledEvent = commandHandledEvent
    }
    
    public func handle(command command: Command) {
        print("You have to override this method!")
    }
    
    public func complete(object object: AnyObject?) {
        if let eventName = self.commandHandledEvent {
            NSNotificationCenter.defaultCenter().postNotificationName(eventName, object: object)
        }
    }
}