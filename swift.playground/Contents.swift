//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Test {
  var temperature: Int
  var response: String?
  init (_ summer: Int) {
    self.temperature = summer*2
  }
  var description: String {
    return "The Current Temperature is \(self.temperature)"
  }
  func description1()  {
    print("The current temperature is \(self.temperature)")
  }
}

var t = Test(20)
t.description

t.description1()