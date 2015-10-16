![CommandBus](https://github.com/Ekhoo/CommandBus/blob/master/Source/Asset/CommandBus.png)

[![Version](https://img.shields.io/cocoapods/v/CommandBus.svg?style=flat)](http://cocoapods.org/pods/CommandBus)
[![License](https://img.shields.io/cocoapods/l/CommandBus.svg?style=flat)](http://cocoapods.org/pods/CommandBus)
[![Platform](https://img.shields.io/cocoapods/p/CommandBus.svg?style=flat)](http://cocoapods.org/pods/CommandBus)
![](https://img.shields.io/badge/Supported-iOS8-4BC51D.svg?style=flat-square)
![](https://img.shields.io/badge/Carthage-unavailable-red.svg?style=flat)
![](https://img.shields.io/badge/Swift 2-compatible-4BC51D.svg?style=flat-square)

A light weight Command Bus implementation written in Swift

# CommandBus?
The idea of a command bus is that you create command objects that represent what you want your application to do. Then, you toss it into the bus and the bus makes sure that the command object gets to where it needs to go.

So, the command goes in -> the bus hands it off to a handler -> and then the handler actually does the job. The command essentially represents a method call to your application layer.

You can have more informations [here](http://culttt.com/2014/11/10/creating-using-command-bus/).

# Installation
## Cocoapods
CommandBus is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CommandBus", '~> 0.0.2'
```

# Usage
- First, you have to create a json mapping file in order to associate yours Commands with their handler:

```json
{
    "{ModuleName}.{CommandName}": "{ModuleName}.{CommandHandlerName}"
}
```

- Then you can create your Command and inject it to the bus:

```swift
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
}
```

You can also see the [Example](https://github.com/Ekhoo/CommandBus/tree/master/Example) project.

# Author

Ekhoo:
- me@lucas-ortis.com
- [@LucasEkhoo](https://twitter.com/LucasEkhoo)
- [Linkedin](https://fr.linkedin.com/in/lucasortis)

# License

CommandBus is available under the MIT license. See the LICENSE file for more info.
