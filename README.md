# LogDogChalk

Color the output of LogDog.

![](demo.png)


## Usage

```swift
let logger = Logger(label: "App") { label in
    let sink = LogSinks.BuiltIn.medium.suffix("\n").color()
    return SugarLogHandler(label: label, sink: sink, appender: TextLogAppender.stdout)
}
```
