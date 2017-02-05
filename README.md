# ConsoleProgressBar

This module provide the function to display message with progress bar on Console.

# USAGE

```
let consoleProgressBar = ConsoleProgressBar()
downloadFiles(
    passed: { (index, file) in 
        // [==>   ] Donwloading.... file.txt
        consoleProgressBar.update(value: Double(index/count),
                                message: "Donwloading... \(file)")
    }, 
    completion: { finish in
        print("Finish downloading files")
    }
)
```

# INSTALLATION
## Swift Package Manager

Add the following into your dependencies.

```
.Package(url: "https://github.com/ysn551/ConsoleProgressBar", "0.0.1")
```

# LICENSE

[BSD LICENSE](https://opensource.org/licenses/bsd-license.php)

-----------
[@ysn551](https://twitter.com/ysn551),　February 3,2017

