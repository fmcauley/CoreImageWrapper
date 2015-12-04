//: [Previous](@previous)

import Foundation

let exampleFiles = ["README.md", "Helloworld.swift", "HelloSwift.swift", "FlappyBrid.swift"]

//: * the hard way to filter
func getSwiftFiles(files: [String]) -> [String] {
    var result: [String] = []
    for file in files {
        if file.hasSuffix(".swift") {
            result.append(file)
        }
    }
    return result
}

getSwiftFiles(exampleFiles)

//: * example of a filter function

func filter<T>(xs: [T], check: T -> Bool) -> [T] {
    var result: [T] = []
    for x in xs {
        if check(x) {
            result.append(x)
        }
    }
    return result
}

func getSwiftFiles2(files: [String]) -> [String] {
    return filter(files) { file in
        file.hasSuffix(".swift") }
}

exampleFiles.filter{ file in file.hasSuffix(".swift")}

//: [Next](@next)
