//
//  CustomCommandHandler.swift
//  CommandBus
//
//  Created by Lucas Ortis on 09/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

import Foundation

class CustomCommandHandler: CommandHandler {
    
    override func handle(command command: Command) {
        print("Command handled")
    }
}