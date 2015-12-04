//: [Previous](@previous)
//: ### Reduce

import Foundation

func sum(xs: [Int]) -> Int {
    var result: Int = 0
    for x in xs {
        result += x
    }
    return result
}

sum([1,2,3,4,5])

func products(xs: [Int]) -> Int {
    var result: Int = 1
    for x in xs {
        result = x * result
    }
    return result
}

products([1,2,3,4,5])

func prettyPrintArray(xs: [String]) -> String {
    var result: String = "Enter in the array xs:\n"
    for x in xs {
        result = " " + result + x + "\n"
    }
    return result
}

prettyPrintArray(["This", "is", "a", "train", "wreck"])


func reduce<A, R>(arr: [A], initialValue: R, combine: (R, A) -> R) -> R {
    var result = initialValue
    for i in arr {
        result = combine(result, i)
    }
    return result
}

//: * Using reduce func to rewrite all the prior functions

func sumUsingReduce(xs: [Int]) -> Int {
    return reduce(xs, initialValue: 0) { result, x in result + x}
    
}

sumUsingReduce([1,2,3,4,5,6])

//: * the '*' product call can be used because it takes two args and returns one. The call is used to subsitute for the closure that is needed by the function

func productUsingReduce(xs: [Int]) -> Int {
    return reduce(xs, initialValue: 1, combine: *)
}

productUsingReduce([4,5,6,7,8,9])

func concatUsingReduce(xs: [String]) -> String {
    return reduce(xs, initialValue: "", combine: +)
}

concatUsingReduce(["this ", "is ", "a ", "trip"])

//: * Using Standard Swift reduce

func sumUsingStandardReduce(xs: [Int]) -> Int {
    return xs.reduce(0, combine: +)
}

sumUsingStandardReduce([5,6,7,8,9,20])

func productUsingStnadardReduce(xs: [Int]) -> Int {
    return xs.reduce(1, combine: *)
}

productUsingStnadardReduce([10,20,30,40,50])

func concatUsingStandardReduce(xs: [String]) -> String {
    return xs.reduce("", combine: +)
}

concatUsingStandardReduce(["frank ", "rosalyn ", "caroline ", "little frank"])


//: * reudce is a standard function defined on Swift Array

//: [Next](@next)
