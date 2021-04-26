
import Foundation

// Second task - Черга(Queue)

// MARK: - Ознайомитися з принципами роботи черг. Створити клас Queue для зберігання універсальних об’єктів.

class Queue<T> {
	
	enum ValidationError: Error {
		case invalidObject
	}
	
	// MARK: - Клас має симулювати функціональність черги і має:
	/*
	- мати можливість повернути всю колекцію об’єктів
	- мати можливіть додати об’єкт
	- мати можливість повернути об’єкт
	- мати можливість повернути к-ть об’єктів
	- відповідати принципу FIFO
	- має повертати помилки при виключних ситуаціях
	*/
	
	var elements: [T] = []
	
	func enqueue(_ value: T) {
		elements.append(value)
	}
	
	func dequeue() -> T? {
		guard !elements.isEmpty else {
			return nil
		}
		return elements.removeFirst()
	}
	
	var first: T? {
		return elements.first
	}

	var last: T? {
		return elements.last
	}
	
	init(elements: [T]) {
		self.elements = elements
	}

}



