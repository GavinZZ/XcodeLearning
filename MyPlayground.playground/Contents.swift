func greet (person: String) -> String {
  let greeting = "Hello \(person)!"
  return greeting
}

greet("Gavin")

func hello () -> String {
  return "Hello"
}

hello()


print("hello")


let name = [8, 3, 5, 4, 10, 9]

let strl = ["Gavin", "Jerry", "Dylan", "Sida", "Kevin", "Ben"]

let reverseStrl = strl.sort(<)

let reverseName = name.sort(>)

let dictionary = [0: "Happy", 1: "So-so", 2: "Boring", 3: "Angry", 4: "Desperate"]

let reverseDict = dictionary.sort(<)

let digitNames = [
  0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
  5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

var string = ""

var count = numbers.count

var first = 0

while count > 0 {
  
  var num = numbers[count-1]
  
  while num > 0 {
    
    var value = num % 10
    
    string = digitNames[value]! + string
    
    num = num / 10
    
  }
  
  if first <= 1 {
  
    string = " " + string
    
  }
  
  first += 1
  
  count -= 1
  
}

print (string)

enum SomeEnumeration:Int {
  case north, west, east, south
}

var direction = SomeEnumeration.north


direction = .south

switch direction {
case .north:
  print("Heading North")
case .south:
  print("Heading South")
case .east:
  print("Heading East")
case .west:
  print("Heading West")
}

enum planets {
  case mercury(Int, Int), venus(Int, String), earth(Int, Int), mars(Int, Int), jupiter(Int, Int), saturn(Int, Int), uranus(Int, Int), neptune(Int, Int)
}

var planet = planets.venus(2,"here")

switch planet {
case.earth:
  print("Yaaay, our lovely homeland")
case.venus(let first, let second):
  print("OMG, \(first) aliens are coming \(second)")
default:
  print("hmmm")
}

print (SomeEnumeration.north.rawValue)

let possibleDirection = SomeEnumeration(rawValue: 3)



struct Resolution {
  var width = 0
  var length = 0
}

var resolution = Resolution()

print(resolution.width)

var resolution2 = Resolution(width: 2, length: 4)

resolution.width = 4

resolution.length = 8

print(resolution.width)
print(resolution.length)

class Resolution2 {
  var width = 0
  var length = 0
}
var resolution222 = Resolution2()
var resolutionClass = resolution222

resolutionClass.width = 10
resolutionClass.length = 10

print(resolution222.width)
print(resolution222.length)

var res = Resolution2()

resolution222 === resolutionClass
if res !== resolution222 {
  print ("1", terminator:"")
}

print("I love you")
var str:String = "abc"
var str2 = str
str2 = "def"
print (str, terminator:"")

struct A {
  var first: Int
  let range: Int
}

var d = A(first: 3, range: 4)

d.first = 10

struct FixedLengthRange {
  var firstValue: Int
  let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 10


struct Point {
  var x = 0.0, y = 0.0
}
struct Size {
  var width = 10.0, height = 10.0
}
struct Rect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set(newCenter) {
      origin.x = newCenter.x - (size.width / 2)
      origin.y = newCenter.y - (size.height / 2)
    }
  }
}


var rect = Rect()
rect.center.x
print(rect.origin.x)

struct Cuboid {
  var width = 0.0, height = 0.0, depth = 0.0
  func volume() -> Double {
    return width * height * depth
  }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
let v = fourByFiveByTwo.volume()

class C {
  var a = 0
  var b = 0
  func C(_ val: Int, _ val2: Int) {
    a = val
    b = val2
  }
}

















