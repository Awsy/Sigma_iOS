
import Foundation

// Task: Тестування асинхронності


// MARK: - Створити масив для зберігання emoji.

var emojiStack: [String] = []

// MARK: - Створити асинхронну кастомну чергу.

let concurrentQueue = DispatchQueue(label: "emojiStack")

concurrentQueue.async(flags: .barrier) {
	
	let emojiRanges = [
		9800...9924
	]
	
	// MARK: - Додати через асинхронну чергу 125 emoji, по завершенню процесу вивести повідомлення
	
	for range in emojiRanges {
		for i in range {
			
			// MARK: - При додаванні кожного 15 emoji зупинити весь процес на 3 секунди
			sleep(3)
			
			// MARK: - Зчитати та вивести всі смайлики використавши ітерацію від 0 до 125
			let emoji = String(UnicodeScalar(i)!)
			emojiStack.append(emoji)
		}
	}
	
	// MARK: - Трекати прогрес додавання emoji (виводити в лог)
	print(emojiStack)
	print(emojiStack.count)
}

// MARK: - Створити ще одну асинхронну чергу з меншим пріоритетом і запустити додавання 25 emoji з неї в той самий масив

DispatchQueue.global(qos: .background).async {
	let emojiRanges = [
		9800...9924
	]
	for range in emojiRanges {
		for i in range {
			
			let emoji = String(UnicodeScalar(i)!)
			emojiStack.append(emoji)
		}
	}
}


