//: [Previous](@previous)

//: # Map Filter Reduce

//: * These are functions that will act on Swift Arrays
func incrementArray(xs: [Int]) -> [Int] {
    var result: [Int] = []
    for x in xs {
        result.append(x + 1)
    }
    return result
}

incrementArray([1,2,3,4,5])

func doubleArray1(xs: [Int]) -> [Int] {
    var result: [Int] = []
    for x in xs {
        result.append(x * 2)
    }
    return result
}

doubleArray1([1,2,3,4,5,6])

//: * the above functions share a lot of code. We need to reduce these into a more generic form
//: * Update the function to take a second argument to add on the elements of the array

func computeIntArray(xs: [Int], f: Int -> Int) -> [Int] {
    var result:  [Int] = []
    for x in xs {
        result.append(f(x))
    }
    return result
}

func doubleArray2(xs: [Int]) -> [Int] {
    return computeIntArray(xs) {x in x * 2}
}

//: * The output of the call to the doubleArray2 is an array that has doubled the int from the original
doubleArray2([10,11,12,13,14,15])


//: * Generics

func genericComputeArray<U>(xs: [Int], f: Int -> U) -> [U] {
    var result: [U] = []
    for x in xs {
        result.append(f(x))
    }
    return result
}

//: * map is a furthur apstraction of the genericComputeArray function instead of working with [Int] there is a second generic type


//: ### Swift Array struct has a map function

func map<T, U>(xs: [T], f: T -> U) -> [U] {
    var result: [U] = []
    for x in xs {
        result.append(f(x))
    }
    return result
}


//: * xs.map calls into the Swift Array map function
//: * the above map function is just an example of how to write a map like function

func computeIntArray<T>(xs: [Int], f: Int -> T) -> [T] {
    return xs.map(f)
}

//: * the function tells map what types to expect in this example it is Int and Int
func doubleArray3(xs: [Int]) -> [Int] {
    return xs.map { x in 2 * x }
}

doubleArray3([20,21,22,23,24,25])

var someArray = doubleArray3([1, 2, 3, 5, 8, 11])

computeIntArray([11,24,36,48]){
    $0 * 2
}




//: [Next](@next)
