/**
 # String+Extension
 */
extension String {
    // Creates a new string composed of the specified number of a single, repeated self.
    func repeated(_ n: Int) -> String {
        return String(repeating: self, count: n)
    }
}

