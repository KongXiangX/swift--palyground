//: Playground - noun: a place where people can play

import UIKit


//1.Array:存储有序的值
//Set:存储无序的唯一的值
//Dictionary:存储无序的key-value键值对。
//在Swift中，集合明确的知道它能够存贮的值的类型，所以如果插入一个错误的类型，将会错误。
var image = UIImage(named: "collectionTypes")

//1.1 使用var、let 区分其是否可变

// Array
// 存储有序的同一种类型的值
var someInts = [Int]() // 等同于 Array<Int>()
var a = Array<Int>()
var b = (Int)()
print("someInts int类型的数组:\(someInts)  b为int类型的值:\(b)")
someInts.append(3)
// 如果上下文已经清楚了Array中存储的类型，可以使用[]创建一个空Array，赋值给它
someInts = []
// 创建一个带默认值的数组
var threeDoubles = [Double]( repeating: 0.0 ,count: 3)
for _ in 0...5 {
    threeDoubles.append(0.2)
}
threeDoubles
print("1.1 -------------- end ")


//1.2 使用两个Array创建一个Array
var anotherThreeDoubles = [Double](repeating: 2.5 ,count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// 使用数组字面量创建数组
var shoppingList: [String] = ["Eggs", "Milk"]
var anotherShoppingList = ["Eggs", "Milk"] // 字面量初始化的时候 在存储类型一致的情况下，可以省略类型，因为能够推断出来


//1.3 访问修改Array
// 元素个数
shoppingList.count

if shoppingList.isEmpty {  // isEmpty 检测数组是否为空
    print("shoppingList 空")
} else {
    print("shoppingList 非空")
}

// 添加
shoppingList.append("Flour")
shoppingList += ["baking Pwder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

// 获取
var firstItem = shoppingList[0]

// 修改
shoppingList[0] = "Six eggs"
shoppingList
shoppingList.count

// 使用区间更新元素 区间不能越界 如果元素少于区间数量，将会删除多余得空间. 如果多于区间数量 数组将会增大，但是不能用于在数组末尾添加元素
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.count


shoppingList

// 插入
shoppingList.insert("Maple Syrup", at: 0)

// 删除
let mapleSyrup = shoppingList.remove(at: 0)
print("mapleSyrup的值为\(mapleSyrup)")

shoppingList
let apples = shoppingList.removeLast()
shoppingList.removeFirst()
print("数组的第一个值：\(shoppingList.removeFirst())")
    
    
    
    
    
print("数组迭代1 --------------- start1")
// 数组迭代
for item in shoppingList {
    print(item)
}

print("数组迭代2 --------------- start2")
// 获取元素索引
for (index, value) in shoppingList.enumerated() {
    print("Item \(index): \(value)")
}




//2.Set 无序存储相同类型的不同的值，存储值的类型必须是hashable的。Swift基本类型、枚举成员都是hashable的。
// 创建一个空Set
var letters = Set<Character>() // !!!与Array不同 Set没有简写的方式
letters.insert("a")
letters = [] // 存储类型及本身类型已知 可以使用空数组创建一个Set

// 使用数组字面量创建Set Swift不能通过数组的字面量推断出Set类型，所以下面得Set声明不能省略，但是如果值是同一种类型，可以省略值类型
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var anotherFavoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

// 访问、修改Set
favoriteGenres.count
if favoriteGenres.isEmpty {
    print("I have \(favoriteGenres.count) favorite music genres.")
}

// 插入
favoriteGenres.insert("Jazz")

//删除 remove(_:) 返回一个optional
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

// 包含
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
}

//迭代
for genre in favoriteGenres {
    print("\(genre)")
}
// 排序迭代
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}



//3.集合操作 下图展示了集合操作
image = UIImage(named: "SetOperations")

var oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
// 并集
oddDigits.union(evenDigits).sorted()
// 交集
oddDigits.intersection(evenDigits).sorted()
// 补集
//oddDigits.subtract(evenDigits).sort()

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

// 集合关系和比较
//使用“是否等”运算符(==)来判断两个集合是否包含相同的值。
//使用isSubsetOf(_:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
//使用isSupersetOf(_:)方法来判断一个集合中包含的值是另一个集合中所有的值。
//使用isStrictSubsetOf(_:)或者isStrictSupersetOf(_:)方法来判断一个集合是否是另外一个集合的子集合或者父集合,并且和特定集合不相等。
//使用isDisjointWith(_:)方法来判断两个集合是否不含有相同的值。

image = UIImage(named: "setEulerDiagram")

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true






//4.Dictionaries 字典是一种存储多个相同类型的值的容器。
//每个值（value）都关联唯一的键（key），键作为字典中的这个值数据的标识符。和数组中的数据项不同，字典中的数据项并没有具体顺序。我们在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样。key要求是可哈希化的类型
//4.1 创建空Dictionary
var namesOfIntegers = [Int: String]()
var anotherNamesOfIntegers = Dictionary<Int, String>()

namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
print(namesOfIntegers)

//通过字面量创建
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var anotherAirports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"] //key/value 一致 能够推断

//4.2访问、修改Dictionary
airports.count

if airports.isEmpty {
    print("airports空字典")
}

// 添加、修改
airports["YYZ"]
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

// updateValue(_:forKey:) 会返回修改前的值（如果存在，否则是nil），是optional的，使用下标获取值也是返回optional
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("DUB key的旧值：  \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("DUB key的新值：\(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

// 删除  赋值为nil 删除一个key-valeu pair
airports["APL"] = "Apple International"
airports["APL"] = nil
// removeValueForKey(_:) 返回optional值
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue)")
}

// 迭代
// 键值
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

//键
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
//值
for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// 获取所有key或者value的数组
let airportCodes = [String](airports.keys)
print("airportCodes键 数组:\(airportCodes)")
let ariportNames = [String](airports.values)
print("ariportNames值 数组:\(ariportNames)")

