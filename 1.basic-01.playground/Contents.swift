//: Playground - noun: a place where people can play

import UIKit
//1. 常量和变量（Constants and Variables）

let a = 10;

var b = 0;
// 同时声明多个变量 ,可是 不是同一个类型的数据
var x = 1.0 , y = 2, z = 20.01;

var x1 = "dd" ,y1 = "dasdf" ,z1 = 33 ;

//2. 类型声明 :空格 (注意格式  var xxx: '空格' 类型)
var  str0: String
str0 = "hello  world";

var red, blue, green: Double
red = 10.01
//blue = "dfd" 错误 因为已经声明为 double 类型
green = 10


//2.1 变量名可以是任意字符 包括Unicode字符，不能包括空格、数学符号、箭头、保留的（或者非法的）Unicode 码位，连线与制表符。也不能以数字开头，但是可以在常量与变量名的其他地方包含数字。
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
// 保留字
let `if` = "如果"

print(你好)
print(你好, str0)
print("--test--")
//TODO:不知道是做什么的  separator :分离器    terminator:终结者
print(str0 , separator: "ddd", terminator: "\n")
print(str0, terminator: "\n")
//如果不想换行，可以传递一个空字符串给`terminator`参数--例如
let greeting = "Greeting"
print(greeting, str0,terminator:"")
// 字符串插值
print("gg   \(greeting)")




//3.注释
// this is a comment

/* this is a comment
 but written over multiple lines */


// 多行注释嵌套
/* aaa
 /* bbb  */
 ----aaa */



//4.分号的使用
//: 分号 与其他大部分编程语言不同，Swift 并不强制要求你在每条语句的结尾处使用分号（;），当然，你也可以按照你自己的习惯添加分号。有一种情况下必须要用分号，即你打算在同一行内写多条独立的语句
let cat = "🐱"; print(cat)




//5.: 整数 提供了8，16，32和64位的有符号和无符号整数类型 Int8 UInt8，另外提供了一Int类型，32位平台=Int32，64位平台=Int64
let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型的最小值
let maxValue = UInt8.max  // maxValue 为 255，是 UInt8 类型的最大值

// 浮点数 Double表示64位浮点数，Float表示32位浮点数 自动推断为Double
let float = 222.3
float is Double
float is Float


let anotherPi  = 3 + 024153.2135
let intPi = Int(anotherPi)

//6. 数值型字面量
let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17
// 1.25e2 表示 1.25 × 10^2，等于 125.0
1.25e2
// 1.25e-2 表示 1.25 × 10^-2，等于 0.0125
1.25e-2

//6.1 可读性增强  只能是下划线
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


//6.2 数值型类型转换 超出范围编译阶段就能检测到
//let cannotBeNegative: UInt8 = -1
// UInt8 类型不能存储负数，所以会报错
//let tooBig: Int8 = Int8.max + 1
// Int8 类型不能存储超过最大值的数，所以会报错

// 不同类型得数值，不能直接相加，必须使用构造方法转换
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


//7. typealias 类型别名
//其实typealias就相当于objective-c中的typedef,就是将类型重命名，看起来更加语义化。
//
typealias Location = CGPoint
typealias Distance = Double
func distanceBetweenPoint2(location: Location, toLocation: Location) -> Distance {
    let dx = Distance(location.x - toLocation.x)
    let dy = Distance(location.y - toLocation.y)
    return sqrt(dx * dx + dy * dy)
}
let origin2: Location = Location(x: 0, y: 0)
let point2: Location = Location(x: 1, y: 1)
let distance2: Distance = distanceBetweenPoint2(location: origin2, toLocation: point2)


//8.布尔值 Bool true false not YES NO
// BOOL 不能像OC那样使用1 与 0判定
// if 1 {} // error
var  a2: Bool = true
a2 = 3 > 2
if a2  {
    print("3 < 2 错误")
}




//9.Tuples 元组 把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
let http404Error = (404, "Not Found")
//9.1 http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
let (statusCode, statusMessage)  = http404Error;
print("状态Code: \(statusCode)")
// 输出 "状态Code: 404"
print("状态MSG \(statusMessage)")
// 输出 "状态MSG Not Found"


let (justTheStatusCode, _) = http404Error;
print("The status code is \(justTheStatusCode)")
//print("The status code is \(_)") 错误

//9.2 使用索引
print("状态Code: \(http404Error.0)")
// 输出 "状态Code: 404"
print("状态MSG \(http404Error.1)")
// 输出 "状态MSG Not Found"


//9.3 在定义元组的时候给单个元素命名
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
// 输出 "The status code is 200"
print("The status message is \(http200Status.description)")
// 输出 "The status message is OK"

// 作为一个多参数的返回值 元组十分合适




//10.可选类型
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"

// 通过赋值nil，设置一个变量为没值的状态
var serverResponseCode: Int? = 404
//serverResponseCode = nil
print("serverResponseCode是 \(serverResponseCode)")

var surveyAnswer: String? = " sd"
print("surveyAnswer是 \(surveyAnswer)")


// 错误 写法 1
//var a3: Int ;
// 错误 写法 2
//var a3: Int ？;

var a3: Int?;
print("a3是 \(a3)")
// 没有提供初始值的optional variable，默认设置为nil
// nil 在swift、Objective-C不同。在Objective-C中，nil是一个指向不存在的对象的指针，在Swift中，nil指向一个缺失的值



//11. if 语句以及强制解析
let a4 = "456"
let b4 = Int(a4)

if b4 != nil {
    print("b4 含有int值")
    // 确定有值 使用! 强制解析使用
    print("\(a4) 含有int值 \(b4!)")
}else{
    print("b4 不含int值")
}

//11.1可选绑定（optional binding）
if let b5 = Int(a4) {
    print("a4 有int值")
}

var a6: Int? = 456,b6: Int? = 789;
if let a7 = a6,let b7 = b6 {
    print(a7, b7)
}

//var a6: Int? ,b6: Int?
//if let a7 = a6,let b7 = b6 {
//    print(a7, b7)
//}


//11.2 隐式解析可选类型
let possibleString: String? = "一个可选的字符"
print(possibleString!) // 需要惊叹号来获取值
// 输出 "一个可选的字符"  
// 如果不加 '!' 输出的是 “Optional("一个可选的字符")”


let assumedString: String! = "隐式打开的可选字符串"
print(assumedString)  // 不需要感叹号
// 输出 "隐式打开的可选字符串"



//12.错误处理
func canThrowanError() throws {
}


enum MyError: Error {
    case error1
    case error2(description: String)
}
do {
    try canThrowanError()
} catch MyError.error1 {
    // an error was thrown
} catch MyError.error2(let description) {
    
}




//13.assert 断言
let age = 1
assert(age >= 0, "年龄一定大于0");