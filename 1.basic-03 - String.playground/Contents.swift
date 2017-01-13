//: Playground - noun: a place where people can play

import UIKit

//1.字符串字面量 使用""包裹起来
let someString = "Some 是的呢"

//2.初始化一个空字符串
var emptyString = ""
var anotherEmptyString = String()
emptyString == anotherEmptyString

//2.1 判断空字符串
if emptyString.isEmpty {
    print("空")
}

//3.字符串的可变性 
//不同于Objective-C Swift使用var、let对应可变、不可变；
//Objective-C NSString/NSMutableString
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"  // 常量不能改变 error

//:Swift 的String类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作或在函数/方法中传递时，会进行值拷贝。 任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操作。在实际编译时，Swift 编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您将字符串作为值类型的同时可以获得极高的性能。


//4.使用字符（Working with Characters）
for character in "Dog!🐶".characters {
    print(character)
}

//4.1 使用Character类型声明一个字符
let exclamationMark: Character = "!"

//4.2通过字符构造字符串
let catCharacters: [Character] = ["C", "a", "t", "!","🐱"]
let catString = String(catCharacters)

//4.3 连接字符串和字符
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2
// 使用append方法添加字符
//welcome + exclamationMark
welcome.append(exclamationMark)



//5.字符串插值 (String Interpolation)。插值字符串中写在括号中的表达式不能包含非转义双引号 (") 和反斜杠 (\)，并且不能包含回车或换行符。
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"





//6.计算字符数量（Counting Characters） XXXX.characters.count
//如果需要计算占用的内存 还需要迭代计算
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
unusualMenagerie.lengthOfBytes(using: String.Encoding.utf8)
print("unusualMenagerie 的字符串个数： \(unusualMenagerie.characters.count) ")

var word = "cafe"
word.lengthOfBytes(using: String.Encoding.utf8)
print("word 的字符串个数：\(word.characters.count)")
word += "\u{301}"
word.lengthOfBytes(using: String.Encoding.utf8)
print("word 的字符串个数： \(word.characters.count)")



//7.访问、修改字符串
let str = "世界 程序员过的不好啊"

let ocStr = str as NSString
let ss = ocStr.substring(with: NSMakeRange(2, 3))
print(ss) //空格没有被打印


print(str.startIndex)
print(str.endIndex)


let s2 = str.substring(from: "的".endIndex)
print(s2)

let s3 = str.substring(from: "fff".endIndex)
print(s3)


//取 子字符串的范围  不懂....
if let range = str.range(of: "1") {
    print("有这个字")
}else {
    print("没有这个字")
    
}
let rr = str.range(of: "的")
print(rr!)
print(str.substring(with: rr!))



//8. 插入、删除





//9.字符串比较
// String and Character Equality == !=
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQustion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQustion {
    print("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}" // 英语
let cyrillicCapitalLetterA: Character = "\u{0410}" // 俄语
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two strings are not equal")
}

// 前缀/后缀相等 (Prefix and Suffix Equality)

quotation.hasPrefix("We")
quotation.hasSuffix(".")






//10 .了解 Unicode 标量 (Unicode Scalars)
//介绍了一些Unicode编码的知识 
// String字面值中的一些特殊字符 \0 \\ \n \r \" \' 标量使用u{n}表示
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

// Extended Grapheme(字母) Clusters(群集) 将一个或者多个Unicode标量组合成一个易读的字符
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"
eAcute == combinedEAcute

// 韩语中一个音节 可以拆分
let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

// 被标记包围
let enclosedEAcute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"


//了解 Unicode Representations of Strings
let dogString = "Dog‼🐶"
var image = UIImage(named: "String.utf8")
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")

image = UIImage(named: "String.utf16")
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Unicode Scalar Representation
image = UIImage(named: "String.utf32")
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}



