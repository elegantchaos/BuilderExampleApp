# BuilderExample

This is an example project for [Builder](https://github.com/elegantchaos/Builder), which is a build tool layered on top of the Swift Package Manager.

To build this example:

```
swift run build
```

What this does is:

- fetch the dependencies
- build Builder itself (the `build` command)
- runs Builder, which builds the Example
