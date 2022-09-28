//
//  TempConverter.swift
//  TempConverterApp
//
//  Created by Angela Chen on 9/14/22.
//

import Foundation
class TempConverter {
  
  // Not essential, but makes code a little cleaner later
    // See the Enums playground from lecture 2 for more on enums
    enum TempUnit: String {
    case fahrenheit = "ºF"
    case celsius = "ºC"
   }
    
  // MARK: Fields
  var isConvertingCtoF: Bool = true
  var inputTemp: Int = 0
  var convertedTemp: Int?
    
  // Checks if the input temperature is below absolute zero
  func isBelowAbsoluteZero() -> Bool {
    if (inputTemp < -273 && isConvertingCtoF) {
      return true
    }
    else if (inputTemp < -459 && !isConvertingCtoF) {
      return true
    }
    else {
      return false
    }
  }
    
  // Set the input units (using switch-case instead of if-else, although both work)
  func setInputUnit(_ tempUnit: TempUnit) {
    //var inputUnit: TempUnit
    switch (tempUnit == .celsius){
    case true:
      isConvertingCtoF = true
      //inputUnit = .celsius
    //default:
      //inputUnit = .fahrenheit
    case false:
      //inputUnit = .fahrenheit
      isConvertingCtoF = false
    }
  
    
  }
    
  // Setter and getter methods
  func setInputTemp(_ temp: Int) {
    inputTemp = temp
  }

  func getConvertedTemp() -> Int? {
    return convertedTemp
  }
    
  // Separated functions for temperature conversion by unit
  func convertCtoF() {//-> Int {
    //return Int(inputTemp/5*9+32)
    convertedTemp = Int(inputTemp/5*9+32)
  }
  func convertFtoC() {//-> Int {
    //return Int((inputTemp-32)*5/9)
    convertedTemp = Int((inputTemp-32)*5/9)
  }
    
  // Checks that the value is a valid temp using a guard statement to check if above absolute zero (return nil if not) and calls the appropriate conversion function above
  func convert() {
    guard !isBelowAbsoluteZero() else { convertedTemp = nil; return }

      
//      //if isBelowAbsoluteZero() {
//        //convertedTemp = nil
//        //return nil
//      //}
      if (isConvertingCtoF){
        //convertedTemp = convertCtoF()
        //return convertCtoF()
        convertCtoF()
      }
      else {
        //convertedTemp = convertFtoC()
        //return convertFtoC()
        convertFtoC()
      }
//      convertedTemp = nil
    
  }
}
