![CommandBus](https://github.com/Ekhoo/CommandBus/blob/master/Source/Asset/CommandBus.png)

[![Version](https://img.shields.io/cocoapods/v/CommandBus.svg?style=flat)](http://cocoapods.org/pods/CommandBus)
[![License](https://img.shields.io/cocoapods/l/CommandBus.svg?style=flat)](http://cocoapods.org/pods/CommandBus)
[![Platform](https://img.shields.io/cocoapods/p/CommandBus.svg?style=flat)](http://cocoapods.org/pods/CommandBus)

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
pod "CommandBus", '~> 0.0.1'
```

# Usage
- Create a json mapping file:

```json
{
    "{ModuleName}.{CommandName}": "{ModuleName}.{CommandHandlerName}"
}
```
- Then you can create your `CommandBus` and inject it your mapping file name without the extension.

```swift
    let commandBus: CommandBus = try! CommandBus(configurationFileName: "mappingFileName");
```

- Create your `CustomCommand` by inhereting from `Command`
- Create your `CustomCommandHandler` by inhereting from `CommandHandler`
- You can execute your `Command`:
```swift
    let customCommand: CustomCommand = CustomCommand()
    commandBus.execute(command: customCommand);
```

# Example
```json
{
    "CommandBus.CustomCommand": "CommandBus.CustomCommandHandler"
}
```

```swift
func myFunc() {
    let commandBus: CommandBus = try! CommandBus(configurationFileName: "configuration");
    let customCommand: CustomCommand = CustomCommand()
        
    commandBus.execute(command: customCommand);
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
