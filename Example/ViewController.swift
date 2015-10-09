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
        
        let commandBus = try! CommandBus(configurationFileName: "configuration");
        let customCommand: CustomCommand = CustomCommand()
            
        commandBus.execute(command: customCommand);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

