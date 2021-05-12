

import Foundation


class Mathematics {
	//MARK: - Написати функцію applyKTimes яка приймає integer K і замкнення та викликає замкнення К разів. Замкнення не приймає жодних параметрів і повертає пусте значення.
	
	func applyKTimes(K: Int,_ closure: (Int)->Void) {
		return closure(K)
	}
	
	//MARK: - Написати функцію об’єднання strings з масиву в один рядок використавши reduce
	
	func strArrCombo(str: [String], arrElement: String) -> String {
		let combinedElements = str.reduce("", {$0 + $1})
		return combinedElements
		
		// MARK: - Написати функцію forEach(array: [Int], _ closure: Int -> ()) яка приймає масив integers і замкнення і виконує замкнення на кожному елементі масиву
		
		func forEach(array: [Int], closure: (Int) -> ()) {
			array.forEach(closure)
		}
		
	}
	

}
