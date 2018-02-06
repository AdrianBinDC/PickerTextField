//
//  ViewController.swift
//  PickerTextField
//
//  Created by Adrian Bolinger on 2/5/18.
//  Copyright © 2018 Adrian Bolinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var colorTextField: UITextField!
  @IBOutlet weak var sizeTextField: UITextField!
  
  var colorPicker: UIPickerView!
  var sizePicker: UIPickerView!
  
  var colors = ["Red", "White", "Blue"]
  var sizes = ["Small", "Medium", "Large", "Extra Large"]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    colorTextField.placeholder = "Gender"
    sizeTextField.placeholder = "Select a size"
    
    // Initialize the pickers
    colorPicker = UIPickerView()
    sizePicker = UIPickerView()
    
    [colorPicker, sizePicker].forEach { picker in
      picker?.delegate = self
      picker?.dataSource = self
    }
    
    colorTextField.inputView = colorPicker
    sizeTextField.inputView = sizePicker

  }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  
  // DataSource
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    switch pickerView {
    case colorPicker:
      return 1
    case sizePicker:
      return 1
    default:
      return 0
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch pickerView {
    case colorPicker:
      return colors.count
    case sizePicker:
      return sizes.count
    default:
      return 0
    }
  }
  
  // Delegate Methods

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    switch pickerView {
    case colorPicker:
      return colors[row]
    case sizePicker:
      return sizes[row]
    default:
      return ""
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    switch pickerView {
    case colorPicker:
      colorTextField.text = colors[row]
    case sizePicker:
      sizeTextField.text = sizes[row]
    default:
      return
    }

  }
  
  
}
