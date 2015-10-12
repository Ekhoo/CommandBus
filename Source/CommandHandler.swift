//
//  CommandHandler.swift
//  CommandBusExample
//
//  Created by Lucas Ortis on 09/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

import Foundation

class CommandHandler {
    required init() {
    }
    
    func handle(command command: Command) {
        print("You have to override this method!")
    }
}