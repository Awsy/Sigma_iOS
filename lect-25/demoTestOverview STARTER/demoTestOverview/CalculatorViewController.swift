//
//  ViewController.swift
//  demoTestOverview
//
//  Created by Sigma Software University.
//  Copyright - present. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {

  @IBOutlet private var inputTextFiled: UITextField!
  @IBOutlet private var buttons: [UIButton]!

  // MARK: - LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()

    updateAppearanceStyle()
  }

  // MARK: - Actions

  @IBAction private func buttonPressed(_ sender: UIButton) {

  }

  @IBAction private func didChangeText(_ sender: UITextField) {

  }

  // MARK: - Private

  private func updateAppearanceStyle() {
    buttons.forEach { (button) in

      let tag = button.tag
      if let inputCodeType = InputCode(rawValue: tag) {
        button.setTitle(inputCodeType.title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)

        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 3
        if inputCodeType.isControlInput {
          button.backgroundColor = .darkGray
          button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        }

        if inputCodeType.isConfirmButton {
          button.backgroundColor = .orange
        }
      }

    }
  }
}
