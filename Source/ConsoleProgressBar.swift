import Foundation

/**
 # ConsoleProgressBar
 This class has the function to present progress bar on Console.
 */
public class ConsoleProgressBar {
    public let progressMaxWidth: Int
    public let encodingOfConsole: String.Encoding
    public let progressDirection: Direction

    public enum Direction {
        case right
        case left
    }

    public init(width: Int = 10, direction: Direction = .right, encoding: String.Encoding = .utf8) {
        self.progressMaxWidth = width
        self.progressDirection = direction 
        self.encodingOfConsole = encoding
    }

    /// A Boolean value that determines whether the progress bar is hidden.
    public var isProgressBarHidden: Bool = false


    private var previousOutput: String = ""

    /// Updates the progress rate and the displaying message on Console.
    public func update(value: Double, message: String) {
        self.clear()

        let outputString = { 
            if self.isProgressBarHidden {
                return message
            } else {
                return self.progressString(value) + " " + message
            }
        }() as String

        self.write(outputString)
        self.previousOutput = outputString
    }

    /// Presnts progress bar in string
    private func progressString(_ rate: Double) -> String {
        // 進捗率を計算
        let completeWidth = Int(Double(self.progressMaxWidth) * rate)
        let remainWidth = self.progressMaxWidth - completeWidth

        switch self.progressDirection {
        case .right:
            if remainWidth > 0 {
                return "[" + "=".repeated(completeWidth) + ">" + " ".repeated(remainWidth - 1) + "]"
            } else {
                return "[" + "=".repeated(completeWidth) + " ".repeated(remainWidth) + "]"
            }

        case .left:
            if remainWidth > 0 {
                return "[" + " ".repeated(remainWidth - 1) + "<" + "=".repeated(completeWidth) + "]"
            } else {
                return "[" + " ".repeated(remainWidth) + "=".repeated(completeWidth) + "]"
            }
        }
    }

    /// Clears previous output messages on console.
    private func clear() {
        let spaces = String(repeating: " ", count: self.previousOutput.characters.count)

        // clear the diplayed output message on terminal
        self.write(spaces)
    }

    /// Writes message on console
    private func write(_ message: String) {
        let buf = ("\r" + message).cString(using: .utf8)
        let nbytes = buf?.count ?? 0
        let _ = Foundation.write(STDOUT_FILENO, buf, nbytes)
        fflush(stdout)
    }
}

