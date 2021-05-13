import Foundation


// Task 2
var num1: UInt8 = 12
var num2: Int8 = -100
var num3: Int = 80
var num4: Int16 = 0
var num5: UInt64 = 18446744073709551615
var num6: Float = 10_235.34
var symb: Character = "a"
var greets: String = "Hello World"
var isCompared: Bool = true
var tupleExample = (12, "twelve")


// Task 3

var taskStr = "Hello World. This is Swift programming language"

// 1
print("This text contains \(taskStr.count) symbols")

// 2
let replaced = taskStr.replacingOccurrences(of: "i", with: "u")
print(replaced)

// 3
let characterSet = CharacterSet(charactersIn: "o o d")
taskStr = taskStr.components(separatedBy: characterSet).joined(separator: " ")

// 4
let additionalStr = "(modified)"
taskStr.append(additionalStr)

// 5
taskStr.isEmpty

// 6
taskStr.append(".")

// 7
taskStr.contains("Hello")

// 8
taskStr.hasSuffix("world")

// 9
var strIndex = taskStr.index(taskStr.startIndex, offsetBy: 10)
taskStr.insert("-", at: strIndex)

// 10
taskStr.replacingOccurrences(of: "Thus us", with: "It is")

// 11
let fifteenthIndex = taskStr.index(taskStr.startIndex, offsetBy: 15)

print(taskStr[strIndex])
print(taskStr[fifteenthIndex])

// 12
let ending = taskStr.index(taskStr.startIndex, offsetBy: 15)
let range = strIndex..<ending
taskStr[range]

// 13
var str2: String
var str3 = "Another text in here"
str2 = str3

// 14
str2 = "So here is my conclusion: "

str2 += str3

// Task 4

// 1
var integerNumber: Int?

// 2
var decimalNumber: Float?

// 3
integerNumber = 3

// 4
integerNumber! += 3

// 5
integerNumber = -3

// 6
decimalNumber = 3.0

// 7
var pairOfValues: (Int, Float)?

pairOfValues = (6, 4.0)

// 8
if ((pairOfValues?.0) != nil) {
	print("There is an Integer in this tuple")
} else {
	print("No integers found")
}

// 9
if ((pairOfValues?.1) != nil) {
	print("There is a decimal in this tuple")
} else {
	print("No decimals found")
}
