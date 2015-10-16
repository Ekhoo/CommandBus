//
//  ViewController.swift
//  CommandBus
//
//  Created by Lucas Ortis on 09/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*** Register to the Command event ***/
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onCommandHandled:", name:"COMMAND_DONE", object: nil)
        
        /*** Create the CommandBus ***/
        let commandBus: CommandBus = try! CommandBus(configurationFileName: "configuration")
        
        /*** Create your own CommandHandler ***/
        let customCommand: CustomCommand = CustomCommand()
        
        /*** Send your commandHandler to the CommandBus with your event name ***/
        commandBus.handle(command: customCommand, commandHandledEvent: "COMMAND_DONE")
    }

    func onCommandHandled(notification: NSNotification) {
        /*** This method is called when the CommandHandler have done ***/
        print("Command Handled: \(notification.object!)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

