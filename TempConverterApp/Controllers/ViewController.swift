//
//  ViewController.swift
//  TempConverterApp
//
//  Created by Angela Chen on 9/14/22.
//

import Foundation
class ViewController: ObservableObject {
  let tempConverter = TempConverter()
  
  @Published var inputTempString: String = "Temp"
  @Published var convertedTempString: String = "Temp"
  @Published var isConvertingCtoF: Bool = true
  
  func setInputTempString(_temperature: String ) {
    inputTempString = _temperature
    
  }
  
  func setConvertedTempString() {//-> String {
    //if let convertedTempString = tempConverter.convertedTemp{
    //  return String(tempConverter.convertedTemp!)
    //}
    //else{
      //return "N/A"
    //}
    if let ct = tempConverter.getConvertedTemp() {
      convertedTempString = String(ct)
    }
    else {
      convertedTempString = "N/A"
    }
//    if tempConverter.getconvertedTemp() == nil{
//      convertedTempString = "N/A"
//    }
//    else {
//      let ct = tempConverter.convertedTemp
//      convertedTempString = String(ct)
//    }
  }
  
  func setInputTempUnit() {
    isConvertingCtoF ? tempConverter.setInputUnit(.celsius) : tempConverter.setInputUnit(.fahrenheit)
  }
  
  func convert() {
    //if inputTempString == nil{
    //} //?cast the inputTempString into a Int. However, since that is an optional and may return nil, we can use nil coalescing to set it to -500 automatically if it is nil.
    //inputTempString = Int(inputTempString)
    if Int(inputTempString) == nil {
      //inputTempString = "-500"
      tempConverter.inputTemp = -500
    }
    else {
      //inputTempString = Int(inputTempString)
      tempConverter.inputTemp = Int(inputTempString)!
    }
    
    setInputTempUnit()
    tempConverter.setInputTemp(tempConverter.inputTemp)
     //? step 11 part 3
    tempConverter.convert()
    setConvertedTempString()
    
    
          
    
  }
  
}
