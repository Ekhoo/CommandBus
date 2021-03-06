//
//  CommandBus.swift
//  CommandBusExample
//
//  Created by Lucas Ortis on 09/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

import Foundation
import SwiftyJSON

public class CommandBus {
    
    private var mapping: JSON!
    
    public init?(configurationFileName: String) {
        let filePath = NSBundle.mainBundle().pathForResource(configurationFileName, ofType:"json")
        var errorMessage: String?
        
        if filePath == nil {
            errorMessage = "CommandBus => Configuration file not found!"
        }
        
        let data = NSData(contentsOfFile:filePath!)

        if data == nil {
            errorMessage = "CommandBus => Can't read the configuration file!"
        }

        let json = JSON(data: data!)
        
        if json == nil {
            errorMessage = "CommandBus => Can't convert the configuration file into JSON!"
        }
        
        if let error = errorMessage {
            print(error)
            
            return nil
        }
        
        self.mapping = json
    }

    public func handle(command command: Command, commandHandledEvent: String?) {
        let commandType: String = self.getTypeFromCommand(command: command)
        let handlerType: CommandHandler.Type = self.getHandlerTypeFromCommandType(commandType: commandType)
        let handler: CommandHandler = handlerType.init(commandHandledEvent: commandHandledEvent)
        
        handler.handle(command: command)
    }
    
    private func getHandlerTypeFromCommandType(commandType commandType: String) -> CommandHandler.Type {
        let types: [String] = commandType.componentsSeparatedByString(".")
        let moduleName: String = types[0]
        let handlerType = self.mapping[types[1]].string!
        
        return NSClassFromString(String(format: "%@.%@", moduleName, handlerType)) as! CommandHandler.Type
    }
    
    private func getTypeFromCommand(command command: Command) -> String {
        return NSStringFromClass(command.dynamicType)
    }
}