//: Playground - noun: a place where people can play

import UIKit

//1.运算符分为一元、二元、三元。一元 + - ++ --  二元 + - % 三元 ?:。受运算符影响的值叫操作数

//1.1 值运算符= 没有返回值
let b = 10
let (x, y) = (1, 2)
//if x = y {} // 错误


//1.2 算术运算符 + - * 
// 操作符不能溢出 Int.max + 1 错误  溢出运算符 &+ &- &*
1 + 2
5 - 3
2 * 3
10.0 / 2.5

11/3
11/3.0
11/5
11/5.0


"hello" + " world"

//1.3取余运算符 % 
//求余运算（a % b）是计算b的多少倍刚刚好可以容入a，返回多出来的那部分（余数）。在对负数b求余时，b的符号会被忽略。这意味着 a % b 和 a % -b的结果是相同的。
let a1 = 9, b1 = 4
let c1 = a1 % b1
print(c1)
// a1 = (b1 * 倍数:Int) + c1

9 % 4
9 % -4
-9 % 4

8 % 2
//8 % 2.0   错误写法 正确写法如下
//truncatingRemainder 截断 剩余
/**
 '%' is unavailable: Use truncatingRemainder instead
 现在不可以直接这样写了
 let rem = 10 % 2.3
 */
let rem = CGFloat(8).truncatingRemainder(dividingBy: 2.0);
print("rem==\(rem)")



//1.4自增++ 自减-- 一元负号运算符- 一元正号运算符+
var a = 10
a += 1 //不可以使用a++  或者  ++a
print(a)
a %= 4
a
a = -99
a = +99




//1.5 比较运算符 == != > < >= <=, == 字符串比较
1 == 1
1 < 2
1 <= 3

let name = "world"
if name == "world" {
    print("hello world")
}



//1.7 三目运算符 question ? answer1 : answer2 --> if question { answer1 } else { answer2 } 过渡使用可能造成代码难以阅读
//1.7.1

let hasHeader = true
let frameY = hasHeader ? 50 : 10

//1.7.2
var tmpFrameY = 0
if hasHeader {
    tmpFrameY = 50
} else {
    tmpFrameY = 10
}
//let frameY = tmpFrameY




//1.8 空合运算符(Nil Coalescing Operator)
//a ?? b ---> a != nil ? a! : b   a必须是optional的
let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "gree"
colorNameToUse = userDefinedColorName ?? defaultColorName



//1.9 区间运算符 
//... 小于等于
//..< 小于
for index in 1...5 {
    print(index)
}
//输出
/*
1
2
3
4
5
*/


for index in 1..<3 {
    print(index)
}
//输出
/*
 1
 2
 */




//2.0 逻辑运算符 ! && ||
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

// 可以组合 使用括号明确优先级
if (a > 2 && a < 6) || (a > 10 && a<30) {}
