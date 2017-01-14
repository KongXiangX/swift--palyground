//: Playground - noun: a place where people can play

import UIKit
//Function 函数是用来完成特定任务的独立的代码块。你给一个函数起一个合适的名字，用来标识函数做什么，并且当函数需要执行的时候，这个名字会被“调用”。每个函数都有一种类型，由参数类型和返回类型组成。可以作为参数在调用函数的时候传入。


//1.Defining and Calling Funcitons 定义、调用函数

func sayHello(name: String) -> String
{
    let a = "Hello" + name + "!";
    return a;
}
print(sayHello(name: "黎明"))

// 简化上面的函数
func sayHelloSample (name: String) -> String
{
    return "Hello" + name + "!";
}
print(sayHello(name: "黎明2"))

//测试1
func sayHello1 (name: String?) -> String
{
    return "test" + name!
}
//不能传nil  或者 null

print(sayHello1(name: "为什么"))
//输出： test为什么


//-----------------------------------------------------//
//:Function Parameters and Return Values
//2. Multiple Input Parameters 多个输入参数
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
print(halfOpenRangeLength(start: 1, end: 10))


func sayHelloTwo(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHello(name: personName)
    } else {
        return sayHelloSample(name: personName)
    }
}
print(sayHelloTwo(personName: "Tim", alreadyGreeted: true))


//-----------------------------------------------------//
//3. Functions Without Parameters 无参函数
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())



//-----------------------------------------------------//
//4.Functions With Return Values 无返回值函数 其实也有返回值 返回类型是Void，等同于()空元组
func sayGoodbye(personName: String) {
    print("再见, \(personName)!")
}
sayGoodbye(personName: "Dave")
// 调用函数的时候，可以忽略返回值
//返回字符串的 床都
func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}
func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint: )
}
printAndCount(stringToPrint: "hello, world")
printWithoutCounting(stringToPrint: "hello, world")



//-----------------------------------------------------//
//5. Functions with Multiple Return Values 多返回值 使用元组
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
//    //1.方法一
//    for index in 0..<array.count {
//        let tem = array[index];
//        print(tem)
//        if tem < currentMin {
//            currentMin = tem
//        } else {
//            if tem > currentMax {
//                currentMax = tem
//            }
//        }
//    }
//    //2.方法二
//    for value in array {
//        if value < currentMin {
//            currentMin = value
//        } else {
//            if value > currentMax {
//              currentMax = value
//            }
//        }
//    }
    //3.方法三
    for value in array[0..<array.count] { // array[0..<array.count] 需要注意
        if value < currentMin  {
            currentMin = value
        } else {
            if value > currentMax {
                currentMax = value
            }
        }
    }
    
//    //错误写法
//    for value in array[0..<array.count] {
//        if value < currentMin  && value <= currentMax{
//            currentMin = value
//        } else {
//            currentMax = value
//        }
//    }
    return (currentMin, currentMax)
}

// 由于返回值中元组的成员定义了名字 可以使用点语法
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("最小值： \(bounds.min) 最大值： \(bounds.max)")




//6.1  Optional Tuple Return Types 如果一个返回值可能为空 可以设置成为optional
func anotherMinMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[0..<array.count] { // array[1..<array.count] 需要注意
        if value < currentMin {
            currentMin = value
        } else {
            if value > currentMax {
                currentMax = value
            }
        }
    }
    return (currentMin, currentMax)
}
if let bounds = anotherMinMax(array: [8, -6, 2, 109, 3, 71]) {
    print("最小值： \(bounds.min) 最大值： \(bounds.max)")
}
if let bounds = anotherMinMax(array: []) {
    print("空数组--最小值： \(bounds.min) 最大值： \(bounds.max)")
}





//-----------------------------------------------------//
//7.Function Parameter Names 参数名。
//每个函数参数都有外部参数名称和本地参数名称。外部参数名称在参数调用的使用使用，本地参数名称在函数实现中使用。默认第一个参数省略它的外部名称，从第二个开始内部、外部名称相同，都是用声明的参数名称。
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // function body goes here
}
someFunction(firstParameterName: 1, secondParameterName: 2)

// Specifying External Parameter Names 指定外部参数名称,当提供了外部参数名称后，参数调用的时候将会一直需要写出来
func someFunction(externalParameterName localParameter: Int) {
    // function body goes here
}
// 另一个版本的sayHello
func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)"
}
sayHello(to: "水电费", and: "lisi")


//7.1 Omitting External Parameter Names 省略外部参数名称 外部参数名称用_代替
func someFunction(firstParameterName: Int, _ secondParameterName: Int) {
    
    print(firstParameterName + secondParameterName);
}

print(someFunction(firstParameterName: 1, 2))



//7.2 Default Prameter Values 参数默认值 如果参数有默认值，在调用的时候可以省略，如果多个参数，带有默认值的参数必须在不带有默认值的参数的后面
func someFunction(parameterWithDefault: Int = 22) {
    // function body goes here
}
someFunction(parameterWithDefault: 1)
someFunction()

//Variadic Parameters 可变参数 在参数列表的最后
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(numbers: 1, 2, 3, 42.15, 5)


//7.3 Constant and Variable Parameters 函数参数默认都是常量。使用var可以使其在声明的时候是变量
func alignRight(string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        _ = padString + string
      
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(string: originalString, totalLength: 10, pad: "-")


//7.4 In-Out Parameters 输入输出参数 只能是变量不能使常量，不能使可变参数 参数传递到函数内部，别处理后，会反映到函数外面 输入输出参数不能有默认值 不能标注let/var
//func swapToInts(a inout: Int, inout _ b: Int) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//var someInt = 3
//var anotherInt = 107
//swapToInts(&someInt, &anotherInt)



//7.5 Function Types 函数类型 每个函数都有一种类型，由参数类型和返回类型组成。
// 下面两个函数的类型是 (Int, Int) -> Int
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

// 下面函数的类型是 () -> Void typealias Void = ()
func printHelloWorld() {
    print("hello, world")
}


//7.6 Using Function Types 在Swift中，你能像使用其他类型一样使用函数类型。
// 下面顶一个变量
var mathFunction: (Int, Int) -> Int = addTwoInts  // mathFunction/addTwoInts 指向同一个方法
print("Result: \(mathFunction(2, 3))")
// 能够使用类型推断 讲一个变量赋值给另一个变量
let anotherMathFunction = addTwoInts

//7.7 Function Types as Parameter Types 将函数类型作为参数传递
//func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
//    print("Result: \(mathFunction(a, b))")
//}
//printMathResult(addTwoInts, 3, 3)


//7.8 Function Types as Return Types 你能使用一个函数类型作为另一个函数的返回值
func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}
var currentValue = 3
var moveNearerToZero = chooseStepFunction(backwards: currentValue > 0) // 现在moveNearerToZero引用正确得函数
print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

//:Nested Functions 嵌套函数 上面定义的这些函数都是全局函数，作用范围是全局。我们也可以在函数内部再定义函数，内部函数默认的作用域是函数内部，但是我们可以让它作为返回值，使其在其他作用域中也能调用。
// 重写上面chooseStepFunction(_:)函数
func anotherChooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    return backwards ? stepBackward : stepForward
}

currentValue = -4
moveNearerToZero = anotherChooseStepFunction(backwards: currentValue > 0) // 现在moveNearerToZero引用正确得函数
print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
