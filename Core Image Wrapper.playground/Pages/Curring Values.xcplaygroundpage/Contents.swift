//: [Previous](@previous)

//: ## Curring Values from functions

//: ### Chapter wrap up
func add2(x: Int) ->  Int -> Int {
    return { y in x + y }
}

func add3(x: Int)(_ y: Int) -> Int {
    return x + y
}

//: * the below are the same. both execute the first arg and then return a func that executes the second arg
add2(3)(3)

var output = add2(3)
output(20)

add3(1)(40)


//: [Next](@next)
