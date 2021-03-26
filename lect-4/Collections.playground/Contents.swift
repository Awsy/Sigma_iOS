import Foundation

// First task - Arrays

/*
1- Опишіть масив fibArray з десяти перших чисел Фібонначі (можна згенерувати або ж використати hardcode).
*/

var fibArray: [Int] = [0, 1]

func fib(_ n: Int) -> [Int] {

	if n <= 1 {
		return fibArray
	}
	for _ in 0..<n - 2 {
		let firstNum = fibArray[fibArray.count - 2]
		let secondNum = fibArray.last!
		
		fibArray.append(firstNum + secondNum)
	}
	
	return fibArray
}

print(fib(10))
//-------------------------------


/*
2- Створіть масив revArray, елементи якого знаходяться в
оберненому порядку відносно масиву fibArray. Зробіть реверсію
масива кількома способами
*/

// First variant
var revArray = fibArray
print(revArray)
revArray.reverse()
print(revArray)

// Second Variant
let reversedArray = revArray.sorted { $0 > $1 }
print(reversedArray)


// Third variant
var reversedArr2 : [Int] = []

for element in revArray.reversed(){
	reversedArr2.append(element)
}

print(revArray)
//-------------------------------


/*
3- Створіть масив shuffledArray, елементи якого перемішані відносно
масиву fibArray. Використайте мінімально можливу операцію для
виконання цього пункту. (завдання на логіку)
*/

var shuffledArray = fibArray
shuffledArray.shuffle()
//-------------------------------


/*
4- Опишіть масив простих чисел snglArray, які не перевищують число
100.
*/

var snglArray: [Int] = []
snglArray.append(contentsOf: 0..<100)
print(snglArray)
//-------------------------------


/*
5- Виведіть на екран кількість елементів масиву snglArray.
*/

snglArray.count
//-------------------------------


/*
6- Виведіть на екран 10-й елемент масив snglArray.
*/
print(snglArray[10])
//-------------------------------


/*
7- Виведіть на екран підмасив елементів масиву snglArray,
починаючи з 15-го та закінчуючи 20-м елементами.
*/

print(snglArray[15...20])
//-------------------------------


/*
8- Створіть масив rptArray з 10 елементів, що рівні 10-му елементу
масиву snglArray.
*/

var rptArray = Array(repeating: 1, count: 10)
print(rptArray)
//-------------------------------

/*
9- Опишіть масив непарних чисел oddArray (не менших за число 0, та
не більших за число 10), використовуючи init(arrayLiteral:).
*/

var oddArray: Array<Int> = Array<Int>(arrayLiteral: 1, 3, 5, 7, 9)
//-------------------------------


/*
10- Додайте до масиву oddArray число 11.
*/

oddArray.append(11)
//-------------------------------


/*
11- Додайте до масиву oddArray числа 15, 17, 19 у якості підмасиву.
*/

oddArray.insert(contentsOf: [15, 17, 19], at: oddArray.count)
//-------------------------------


/*
12- Вставте у масив oddArray число 13 на позицію між числами 11 та
15.
*/

oddArray.insert(13, at: 6)
//-------------------------------

/*
13- Видаліть елементи масиву oddArray, пичинаючи з 5-го та
закінчуючи 8-им (невключно) елементами.
*/

oddArray.removeSubrange(5..<8)
//-------------------------------

/*
14- Видаліть останній елемент масиву oddArray та виведіть його на
екран.
*/

print(oddArray.removeLast())
//-------------------------------


/*
15- Замініть елементи масиву oddArray, починаючи з 2-го та
закінчуючи останнім, на масив з числовими елементами 2, 3, 4.
*/

oddArray.replaceSubrange(2...oddArray.count - 1, with: [2, 3, 4])
//-------------------------------


/*
16- Видаліть елемент масиву oddArray, який рівний числу 3.
*/

oddArray = oddArray.filter { $0 != 3 }
print(oddArray)
//-------------------------------


/*
17- Виведіть значення, яке визначає, чи міститься число 3 у масиві
oddArray.
*/

oddArray.contains(3)
//-------------------------------


/*
18- Виведіть на екран рядкове представлення масиву oddArray.
*/

var strArray = "\(oddArray)"
type(of: strArray)
//-------------------------------



// Second task - Sets


/*
1- Опишіть множину chSet із символів а, b, c та d.
*/

var chSet: Set<Character> = ["a", "b", "c", "d"]
//-------------------------------


/*
2- Створіть mutable множину mChSet на основі множини chSet.
*/

var mChSet: Set<Character>?
mChSet = chSet
//-------------------------------


/*
3- Виведіть на екран кількість елементів множини mChSet.
*/

mChSet?.count
//-------------------------------


/*
4- Вставте символ е в множину mChSet.
*/

mChSet?.insert("e")
//-------------------------------


/*
5- Створіть множину srtChSet, яка є відсортованою версією
множини mChSet.
*/


var srtChSet = mChSet?.sorted()
//-------------------------------


/*
6- Видаліть з множини mChSet символ f та виведіть видалений
символ на екран.
*/

mChSet?.remove("f")
//-------------------------------


/*
7- Видаліть символ d з множини mChSet за його індексом та
виведіть рядкове представлення множини mChSet.
*/

var delMCHSet = mChSet?.firstIndex(of: "d")
mChSet?.remove(at: delMCHSet!)
print(mChSet!)


/*
8- Виведіть відстань у множині mChSet між першим елементом та
символом а.
*/

var firstElement = mChSet?.startIndex
var lastElement = mChSet?.firstIndex(of: "a")
mChSet?.distance(from: firstElement!, to: lastElement!)
//-------------------------------


/*
9- Вставте символ а в множину mChSet.
*/

mChSet?.insert("a")
//-------------------------------



/*
10- Опишіть множини aSet (зі значеннями One, Two, Three, 1, 2) та
bSet (зі значеннями 1, 2, 3, One, Two).
*/

var One = 1
var Two = 2
var Three = 3

var aSet: Set<Int> = [One, Two, Three, 1, 2]
var bSet: Set<Int> = [1, 2, 3, One, Two]
//-------------------------------


/*
11- Створіть множину, яка містить всі спільні елементи для множин
aSet та bSet.
*/

var commonSet = aSet.intersection(bSet)
//-------------------------------


/*
12- Створіть множину, яка містить унікальні елементи у множині aSet
по відношенню до множини bSet. Створіть множину, яка містить
унікальні елементи у множині bSet по відношенню до множини
aSet.
*/

var uniqueAElements = aSet.subtracting(bSet)
var uniqueBElements = bSet.subtracting(aSet)
//-------------------------------


/*
13- Створіть множину, яка містить елементи, які не є спільними для
множин aSet та bSet.
*/

var uniqueElements = bSet.symmetricDifference(aSet)
//-------------------------------


/*
14- Створіть множину, яка об'єднує усі елементи множин aSet та
bSet.
*/

var unitedElements = aSet.union(bSet)
//-------------------------------


/*
15- Опишіть множини xSet (зі значеннями 2...4), ySet (зі значеннями
1...6), zSet (зі значеннями 3, 4, 2) та x1Set (зі значеннями 5, 6, 7).
*/

var xSet: Set<Int>
var ySet: Set<Int>
xSet = Set(2..<4)
ySet = Set(1..<7)
var zSet: Set<Int> = [3, 4, 2]
var x1Set: Set<Int> = [5, 6, 7]
//-------------------------------


/*
16- Виведіть значення, які визначають чи множина xSet входить у
множину ySet, а також чи множина ySet входить у множину xSet.
*/


xSet.isSubset(of: ySet)
ySet.isSubset(of: xSet)
//-------------------------------


/*
17- Виведіть значення, які визначають чи множина xSet містить
множину ySet, а також чи множина ySet містить множину xSet.
*/

xSet.isSuperset(of: ySet)
ySet.isSuperset(of: xSet)
//-------------------------------


/*
18- Виведіть значеня, яке визначає чи множини xSet та zSet є
рівними.
*/

xSet.elementsEqual(zSet)
//-------------------------------


/*
19- Виведіть значення, яке визначає чи множина xSet входить у
множину zSet, але не є рівною множині zSet.
*/

zSet.isStrictSuperset(of: xSet)
//-------------------------------


/*
20- Виведіть значення, яке визначає чи множина xSet містить
множину zSet, але не є рівною множині zSet.
*/

xSet.isStrictSuperset(of: zSet)
//-------------------------------






// Third task - Dictionaries


/*
1- Опишіть словник nDict, ключами якого є числові рядкові
предсталення чисел від 1 до 5, а відповідними значеннями є
рядкові представлення чисел від 1 до 5 на англійській мові
(наприклад, 1:”One”).
*/

var nDict = [1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "five"]
//-------------------------------


/*
2- Виведіть на екран значення масиву nDict за ключем 3.
*/

nDict[3]
//-------------------------------


/*
3- Виведіть на екран значення масиву nDict за індексом ключа 4.
*/

nDict.index(forKey: 4)
//-------------------------------


/*
4- Створіть mutable словник mNDict на основі словника nDict.
*/


var mNDict: [Int:String]

mNDict = nDict
//-------------------------------


/*
5- Додайте елементи 6:”Seven” та 7:”Six” до словника mNDict.
*/

mNDict[6] = "Seven"
mNDict[7] = "Six"
//-------------------------------


/*
6- Оновіть значення елементів словника mNDict, не використовуючи
subscript [], до наступних: 6:”Six”, 7:”Seven”, 8:”Eight”.
*/

mNDict.updateValue("Six", forKey: 6)
mNDict.updateValue("Seven", forKey: 7)
mNDict.updateValue("Eight", forKey: 8)
//-------------------------------



/*
7- Видаліть елемент за ключем 5 зі словника mNDict.
*/

mNDict.removeValue(forKey: 5)
//-------------------------------


/*
8- Видаліть елемент за індексом ключа 4 зі словника mNDict.
*/

mNDict.remove(at: mNDict.index(forKey: 4)!)
//-------------------------------


/*
9- Визначіть та виведіть на екран відстань у словнику mNDict між
парами значень 1:”One” та 7:”Seven”.
*/

var elementOne = mNDict.index(forKey: 1)
var elementSeven = mNDict.index(forKey: 7)

if elementOne! < elementSeven! {
	
	mNDict.distance(from: elementOne!, to: elementSeven!)
}

if elementSeven! < elementOne! {
	
	mNDict.distance(from: elementSeven!, to: elementOne!)
}
//-------------------------------


/*
10- Створіть масив mNDictKeys, елементами якого є усі ключі
словника mNDict.
*/

var mNDictKeys: Array<Int>
mNDictKeys = Array(mNDict.keys)
//-------------------------------


/*
11- Створіть масив mNDictKeys, елементами якого є усі значення
словника mNDict.
*/

var mNDictValues: Array<String>
mNDictValues = Array(mNDict.values)
//-------------------------------


/*
12- Виведіть на екран кількість елементів словника mNDict, а також
кількість його всіх ключів та його всіх значень.
*/

mNDict.count

var mnDictKeys = mNDict.keys
mNDictKeys.count

var mNDictKeyValue = mNDict.values
mNDictKeyValue.count
//-------------------------------


/*
13- Виведіть на екран рядкове представлення словника mNDict.
*/

// Не до конца понял что тут конкретно требуется

print("\(mNDict)")
//-------------------------------
