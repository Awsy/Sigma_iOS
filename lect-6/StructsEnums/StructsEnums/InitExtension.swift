
import Foundation


extension Point {
	
	/*
	6- Описати розширення (в іншому файлі), де визначити два додаткові
	ініціалізатори створення точки на основі інших користувацьких типів
	CartesianCoordinates та PolarCoordinates, які мають бути описані у
	даному файлі (використати методи для ініціалізації обєктів). */
	
	init(cartesian: CartesianPoint) {
		self.cartesianConversion(pointA: 0.0, pointB: 0.0)
	}
	
	init(polar: PolarPoint) {
		self.polarConversion(lat: 0.0, long: 0.0)
	}
}
