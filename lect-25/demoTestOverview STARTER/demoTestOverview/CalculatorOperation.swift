//
//  CalculatorOperation.swift
//  demoTestOverview
//
//  Created by Sigma Software University.
//  Copyright - present. All rights reserved.
//

import UIKit

typealias DisplayOperationValue = String

final class CalculatorOperation {

  private (set) var operands: [Operand] = []
  private (set) var operation: Operation?

  func addOperand(_ operand: Operand) -> DisplayOperationValue {
    operands.append(operand)
    return displayString()
  }

  func prepareForOperation(_ operation: Operation) -> DisplayOperationValue {
    self.operation = operation
    return displayString()
  }

  private func displayString() -> DisplayOperationValue {

    return String.empty
  }
}
