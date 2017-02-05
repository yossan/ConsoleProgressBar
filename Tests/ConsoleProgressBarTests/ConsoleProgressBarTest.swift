//
//  Created by ysn551 on 02/04/2017
//  Copyright © 2017 yossan551. All rights reserved.
//
import XCTest
@testable import ConsoleProgressBar

class ConsoleProgressBarTest: XCTestCase {
    func testDisplaingProgressBar() {
        let pgbar = ConsoleProgressBar() 
        let dlFiles = ["foo.txt", "bar.txt", "ham.txt", "spam.txt", "eggs.txt", "piyo.txt", "fuga.txt"]
        let count = dlFiles.count
        for (i, file) in dlFiles.enumerated() {
            let value = Double(i+1) / Double(count)
            pgbar.update(value: value, message: "Downloading... \(file)")

            Thread.sleep(forTimeInterval: 1.0)
        }
        print("Donload completed!")

        //XCTAssertTrue(true)
    }

    func testDisplaingHiddenProgressBar() {
        let pgbar = ConsoleProgressBar() 
        pgbar.isProgressBarHidden = true
        let dlFiles = ["foo.txt", "bar.txt", "ham.txt", "spam.txt", "eggs.txt", "piyo.txt", "fuga.txt"]
        let count = dlFiles.count
        for (i, file) in dlFiles.enumerated() {
            let value = Double(i+1) / Double(count)
            pgbar.update(value: value, message: "Downloading... \(file)")

            Thread.sleep(forTimeInterval: 1.0)
        }
        print("Donload completed!")

        //XCTAssertTrue(true)
    }
}
