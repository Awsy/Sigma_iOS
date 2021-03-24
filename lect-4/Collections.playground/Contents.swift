import Foundation

// Arrays

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
