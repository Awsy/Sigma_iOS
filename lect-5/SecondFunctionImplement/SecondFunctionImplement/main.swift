
import Foundation

// Second task - Функція сортування масиву.
/*
Створити функцію сортування масиву, яка приймає масив чисел
та сортує його. Алгоритм сортування визначається на етапі виклику
функції. Сортування виконувати двома алгоритмами: бульбашкою та
вибором. Сортування бульбашкою є алгоритмом за замовчуванням.
Реалізація функції не повинна викликати жодну вбудовану функцію
мови Swift (наприклад, типу sort, swap).
*/

// Bubble sort
func arraySortByBubble(_ array: [Int]) -> [Int] {
	var temp = array
	for _ in 0..<temp.count - 1 {
		for j in 0..<temp.count - 1 {
			if (temp[j] > temp[j+1]) {
				let arrElement = temp[j]
				temp[j] = temp[j+1]
				temp[j+1] = arrElement
			}
		}
	}
	
	return temp
}

// Selection sort
func arraySortBySelection(_ array: [Int]) -> [Int] {
	var min = 0
	var j = 0
	var tmp = array
	
	for i in 0..<tmp.count - 1 {
		min = i
		j = i + 1
		for j in stride(from: j, to: tmp.count, by: 1) {
			if (tmp[min] > tmp[j]) {
				min = j
			}
		}
		let arrTmp = tmp[i]
		tmp[i] = tmp[min]
		tmp[min] = arrTmp
	}
	
	return tmp
}

var sampleArr = [7,5,9,6,1,2,0,3]

print("Please choose sort option, type a number and press RETURN")
print("1- Bubble sorting")
print("2- Selection sorting")

while true {
	if let optionInput = readLine() {
		switch optionInput {
			case "1":
				arraySortByBubble(sampleArr)
				print(sampleArr)
				print("Please choose sort option, type a number and press RETURN")
				print("1- Bubble sorting")
				print("2- Selection sorting")
			case "2":
				arraySortBySelection(sampleArr)
				print(sampleArr)
				print("Please choose sort option, type a number and press RETURN")
				print("1- Bubble sorting")
				print("2- Selection sorting")
			default:
				print("Fatal Error: One of the above mentioned options have to be chosen")
				print("Please choose sort option, type a number and press RETURN")
				print("1- Bubble sorting")
				print("2- Selection sorting")
				break
		}
	}
}


