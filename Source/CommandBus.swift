//
//  CommandBus.swift
//  CommandBusExample
//
//  Created by Lucas Ortis on 09/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

import Foundation
import SwiftyJSON

enum CommandBusError: ErrorType {
    case InvalidFileName
    case InvalidFileContent
    case InvalidFileContentType
}

class CommandBus {
    
    private var mapping: JSON!
    
    init(configurationFileName: String) throws {
        let filePath = NSBundle.mainBundle().pathForResource(configurationFileName, ofType:"json")
        
        if (filePath == nil) {
            throw CommandBusError.InvalidFileName
        }
        
        let data = NSData(contentsOfFile:filePath!)

        if (data == nil) {
            throw CommandBusError.InvalidFileContent
        }

        let json = JSON(data: data!)
        
        if json == nil {
            throw CommandBusError.InvalidFileContentType
        }
        
        self.mapping = json
    }
    
    func execute(command command: Command) {
        let commandType: String = self.getTypeFromCommand(command: command)
        let handlerType: CommandHandler.Type = self.getHandlerTypeFromCommandType(commandType: commandType)
        let handler: CommandHandler = handlerType.init()
        
        handler.handle(command: command)
    }
    
    private func getHandlerTypeFromCommandType(commandType commandType: String) -> CommandHandler.Type {
        let handlerType = self.mapping[commandType].string!
        
        return NSClassFromString(handlerType) as! CommandHandler.Type
    }
    
    private func getTypeFromCommand(command command: Command) -> String {
        return NSStringFromClass(command.dynamicType)
    }
}