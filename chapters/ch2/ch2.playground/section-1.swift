// Playground - noun: a place where people can play

import UIKit

var myVariable = 123
let myConstantVariable = 123

myVariable += 5

// (ERROR: can't change a constant variable)
// myConstantVariable += 2

// Explicit type of integer
let anExplicityInteger : Int = 2

// ERROR: constant must contain values when they're declared
// let someConstant: Int

var someVariable: Int

// ERROR: someVariable doesn't have a value, so can't add 2 to it
//someVariable +=2

someVariable = 2
someVariable += 2
// WORKS, because someValirable has a value to add to

// Implicit type of integer
var anInteger = 2

// ERROR: Can't add a string to an integer
// anInteger += "Yes"

// Optional integer, allowed to by nil
var anOptionalInteger : Int? = nil
anOptionalInteger = 42

// Non optional (regular), NOT allowed to be nil
var aNonOptionalInteger = 42

//ERROR: only optional values can be nil
// aNonOptionalInteger = nil

if anOptionalInteger != nil {
    println("It has a value!")
} else {
    println("It has no value!")
}

// Optional types must be unwrapped using !
anOptionalInteger = 2
1 + anOptionalInteger! // = 3

anOptionalInteger = nil
// CRASH: anOptionalInteger = nil, can't use nil data
// 1 + anOptionalInteger!

var unwrappedOptionalInteger : Int!
unwrappedOptionalInteger = 1
1 + unwrappedOptionalInteger // = 2

let aString = String(anInteger)
// = "2"

// ERROR: Can't directly convert between types
// let aString = anInteger

let aTuple = (1, "Yes")
let theNumber = aTuple.0 // = 1
let anotherTuple = (aNumber: 1, aString: "Yes")
let theOtherNumber = anotherTuple.aNumber // = 1

// Array of integers
let arrayOfIntegers : [Int] = [1,2,3]

// Type of array is implied
let implicityArrayOfIntegers = [1,2,3]

// You can also create an emptyarray, but you must provide the type
let anotherArray = [Int]()

let immutableArray = [42,44]

var myArray = [1,2,3]
myArray.append(4)
// = 1, 2, 3, 4

myArray.insert(5, atIndex: 0)
// = [5,1,2,3,4]

myArray.removeAtIndex(4)
// = [5,1,2,3]

myArray.reverse()
// = [3,1,2,5]

myArray.count
// = 4

var crew = [
    "Captain": "Jean-Luc Picard",
    "First Officer": "William Ricker",
    "Second Officer": "Data"
]

crew["Captain"]
// = "Jean-Luc Picard"

crew["Intern"] = "Wesley Crusher"


// This dictionary uses integers for both keys and values
var aNumberDictionary = [1: 2]
aNumberDictionary[21] = 23

if 1+1 == 2 {
    println("The match checks out")
}

// Prints "The math checks out", which is a relief

let loopingArray = [1,2,3,4,5]
var loopSum = 0
for number in loopingArray {
    loopSum += number
}
loopSum // = 15

var firstCounter = 0
for index in 1 ..< 10 {
    firstCounter++
}
// Loops 9 times

var secondCounter = 0
for index in 1...10 { // note the three dots, not two
    secondCounter++
}
// Loops 10 times

var sum = 0
for var i = 0; i < 3; i++ {
    sum += 1
}
sum // = 3

var countDown = 5
while countDown > 0 {
    countDown--
}
countDown // = 0

var countUp = 0
do {
    countUp++
} while countUp < 5
countUp // = 5

var conditionalString : String? = "a string"

if let theString = conditionalString {
    println("The string is '\(theString)'")
} else {
    println("The string is nil")
}
// Prints "The string is 'a string'"

let myNumber = 3
let myString = "My number is \(myNumber)"
// = "My number is 3"

let myOtherString = "my number plus one is \(myNumber + 1)"
// = "My number plus one is 4"

let integerSwitch = 3
switch integerSwitch {
case 0:
    println("It's 0")
case 1:
    println("It's 1")
case 2:
    println("It's 2")
default: // note: default is mandatory if not all
    // cases are covered (or can be convered)
    println("It's something else")
}
// Prints "it's something else"

let stringSwitch = "Hello"

switch stringSwitch {
    case "Hello":
    println("A greeting")
    case "Goodbye":
    println("A farewell")
default:
    println("Something else")
}
// Prints "A greeting"

let tupleSwitch = ("Yes", 123)

switch tupleSwitch {
case ("Yes", 123):
    println("Tuple contains 'Yes' and '123'")
case("Yes", _):
    println("Tuple contains 'Yes' and something else")
default:
    break
}
// Prints "Tuple contains 'Yes' and '123'"

var someNumber = 15

switch someNumber {
case 0...10:
    println("Number is between 0 and 10")
case 11...20:
    println("Number is between 11 and 20")
default:
    println("Number is something else")
}
// Prints "Number is between 11 and 20"

func firstFunction() {
    println("Hello")
}
firstFunction()

func secondFunction() -> Int {
    return 123
}
secondFunction()

func thirdFunction(firstValue: Int, secondValue: Int) -> Int {
    return firstValue + secondValue
}
thirdFunction(1, 2)

func fourthFunction(firstValue: Int, secondValue: Int) -> (doubled: Int, quadrupled: Int) {
    return (firstValue * 2, secondValue * 4)
}
fourthFunction(2, 4)

// Accessing by number:
fourthFunction(2, 4).1 // = 16
// Same thing buy with names:
fourthFunction(2, 4).quadrupled // = 16

func addNumbers(firstNumber num1 : Int, toSecondNumber num2: Int) -> Int {
    return num1 + num2
}

addNumbers(firstNumber: 2, toSecondNumber: 3) // = 5

func multiplyNumbers(#firstNumber: Int, #multiplier: Int) -> Int {
    return firstNumber + multiplier
}
multiplyNumbers(firstNumber: 2, multiplier: 3) // = 6

func multiplyNumbers2 (firstNumber: Int, multiplier: Int = 2) -> Int {
    return firstNumber * multiplier
}
// Parameters with default values can be omitted
multiplyNumbers2(2) // = 4

func sumNumbers(numbers: Int...) -> Int {
    // in this function, 'numbers' is an array of Ints
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}
sumNumbers(2,3,4,5) // = 14

func swapValues(inout firstValue: Int, inout secondValue: Int) {
    let tempValue = firstValue
    firstValue = secondValue
    secondValue = tempValue
}

var swap1 = 2
var swap2 = 3
swapValues(&swap1, &swap2)
swap1 // = 3
swap2 // = 2

var numbersFunc: (Int, Int) -> Int;
// numbersFunc can now store any function that akes two ints and returns an int

// Using the 'addNumbers' function from before, which takes two numbers 
// and adds them
numbersFunc = addNumbers
numbersFunc(2, 3) // = 5

func timesThree(number: Int) -> Int {
    return number * 3
}

func doSomethingNumber(aNumber: Int, thingToDo: (Int) -> Int) -> Int {
    // we've received some function as a parameter, which we refer to as 
    // 'thingToDo' inside this function.
    
    // call the function 'thingToDo' using 'aNumber', and return the result
    return thingToDo(aNumber)
}

// Give the 'timesThree' function to use as 'thingToDo'
doSomethingNumber(4, timesThree) // = 12

func createAdder(numberToAdd: Int) -> (Int) -> Int {
    func adder(number: Int) -> Int {
        return number + numberToAdd
    }
    return adder
}
var addTwo = createAdder(2)
addTwo(2) // = 4

func createIncrementor(incrementAmount: Int) -> () -> Int {
    var amount = 0
    func incrementor() -> Int {
        amount += incrementAmount
        return amount
    }
    return incrementor
}

var incrementByTen = createIncrementor(10)
incrementByTen() // = 10
incrementByTen() // = 20

var incrementByFifteen = createIncrementor(15)
incrementByFifteen() // = 15
incrementByFifteen() // = 30

var sortingInline = [2, 5, 98, 2, 13]
sort(&sortingInline)
sortingInline

var numbers = [2,1,56,32,120,13]
var numbersSorted = sorted(numbers, { (n1: Int, n2: Int) -> Bool in
    // Sort so that small numbers go before large numbers
    return n2 > n1
}) // = [1, 2, 13, 32, 56, 120]

var numbersSortedReverse = sorted(numbers, {n1, n2 in
    return n1 > n2
}) // = [120, 56, 32, 12, 2, 1]

var numbersSortedAgain = sorted(numbers, {
    $0 > $1
}) // = [1, 2, 13, 32, 56, 120]

var numbersSortedReversedAgain = sorted (numbers) {
    $0 > $1
} // = [120, 56, 32, 12, 2, 1]

var numbersSortedReversedOneMoreTime = sorted(numbers) { $0 > $1 }
// = [120, 56, 32, 12, 2, 1]

var comparator = {(a: Int, b: Int) in a < b}
comparator(1, 2) // = true

class Vehicle {
    var color: String?
    var maxSpeed = 80
    
    func description() -> String {
        return "A \(self.color) vehicle"
    }
    
    func travel() {
        println("Traveling at \(maxSpeed) kph")
    }
}

var redVehicle = Vehicle()
redVehicle.color = "Red"
redVehicle.maxSpeed = 90
redVehicle.travel() // prints "Traveling at 90 kph"
redVehicle.description() // = "A Red vehicle"

class Car : Vehicle {
    // Inherited classes can override functions
    override func description() -> String {
        var description = super.description()
        return description + ", which is a car"
    }
}

var redCar = Car()
redCar.color = "Red"
redCar.maxSpeed = 100
redCar.travel()
redCar.description()

class InitAndDeinitExample {
    // Designated (i.e., main) initializer
    init() {
        println("I've been created!")
    }
    // Convenient initializer, require to call the
    // designated initializer (above)
    convenience init (text: String) {
        self.init() // this is mandatory
        println("I was called with the convenience initializer!")
    }
    // This is a convenience initializer that can sometimes fail, returning nil
    // Note thie ? after the word 'init'
    convenience init? (value: Int) {
        self.init()
        
        if value > 5 {
            // We can't initialize this object; return nil to indicate failure
            return nil
        }
    }
    // Deinitializer
    deinit {
        println("I'm going away!")
    }
}

var example : InitAndDeinitExample?

// using the designated initializer
example = InitAndDeinitExample() // prints "I've been created!"
example = nil // prints "I'm going away"

// using the convenience initializer
example = InitAndDeinitExample(text: "Hello")
// prints "I've been created!" and then
// "I was called wiht the conveinence initializer"

let failableExample = InitAndDeinitExample(value: 6)
// = nil

class Counter {
    var number: Int = 0
}
let myCounter = Counter()
myCounter.number = 2

class Rectangle {
    var width: Double = 0.0
    var height: Double = 0.0
    var area: Double {
        // computed getter
        get {
            return width * height
        }
        
        // computed setter
        set {
            // Assume equal dimensions (i.e., a square
            width = sqrt(newValue)
            height = sqrt(newValue)
        }
    }
}

var rect = Rectangle()
rect.width = 3.0
rect.height = 4.5
rect.area // = 13.5
rect.area = 9 // width & height now both 3.0

class PropertyObserverExample {
    var number : Int = 0 {
        willSet(newNumber) {
            println("About to change \(newNumber)")
        }
        didSet(oldNumber) {
            println("Just change from \(oldNumber) to \(self.number)")
        }
    }
}

var observer = PropertyObserverExample()
observer.number = 4
// Prints "About to change to 4", then "Just changed from 0 to 4!"

class SomeExpensiveClass {
    init(id: Int) {
        println("Expensive class \(id) created!")
    }
}

class LazyPropertyExample {
    var expensiveClass1 = SomeExpensiveClass(id: 1)
    // note that we're actually constructing a class,
    // but it's labeled as lazy
    lazy var expensiveClass2 = SomeExpensiveClass(id: 2)
    
    init() {
        println("First class created!")
    }
}

var lazyExample = LazyPropertyExample()
// prints "Expensive class 1 created", then "First class created!"

lazyExample.expensiveClass1 // prints nothing, it's already created
lazyExample.expensiveClass2 // prints "Expensive class 2 created!"

protocol Blinking {
    // This property must be (at least) gettable
    var isBlinking : Bool { get }
    
    // This property must be gettable and settable
    var blinkSpeed : Double { get set }
    
    // This function must exist, but what it does is up to the implementor
    func startBlinking(blinkSpeed: Double) -> Void
}

class Light : Blinking {
    var isBlinking : Bool = false
    
    var blinkSpeed : Double = 0.0
    
    func startBlinking(blinkSpeed: Double) {
        println("I am now blinking")
        isBlinking = true
        
        // We say self.blinkSpeed here to help the compile tell
        // the difference between the parameter 'blinkSpeed' and the property
        self.blinkSpeed = blinkSpeed
    }
}

var aBlinkingThing : Blinking?
// can be ANY object that has the Blinking protocol

aBlinkingThing = Light()

// Using ? after the variable name checks to see
// if aBlinkingThing has a value before trying to work with it
aBlinkingThing?.startBlinking(4.0) // prints "I am now blinking"
aBlinkingThing?.blinkSpeed // = 4.0

extension Int {
    var doubled : Int {
        return self * 2
    }
    func multiplyWith(anotherNumber: Int) -> Int {
        return self * anotherNumber
    }
}

2.doubled // = 4
4.multiplyWith(32) // = 128

extension Int : Blinking {
    var isBlinking : Bool {
        return false
    }
    
    var blinkSpeed : Double {
        get {
            return 0.0
        }
        set {
            // Do nothing
        }
    }
    
    func startBlinking(blinkSpeed: Double) {
        println("I am the integer \(self). I do not blink.")
    }
}

2.isBlinking // = false
2.startBlinking(2.0) // prints "I am the integer 2. I do not blink."

public class AccessControl {
    // Accessible to this podule only
    // 'internal' here is the default and can be omitted
    internal var internalProperty = 123
    
    // Accessible to everyone
    public var publicProperty = 123
    
    // Only accesible in this source file
    private var privateProperty = 123
    
    // The setter is private, so other files can't modify it
    private(set) var privateSetterProperty = 123
}

class Vector2D {
    var x : Float = 0.0
    var y : Float = 0.0
    
    init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
}

func +(left: Vector2D, right: Vector2D) -> Vector2D {
    let result = Vector2D(x: left.x + right.x, y: left.y + right.y)
    
    return result
}

let first = Vector2D(x: 2, y: 2)
let second = Vector2D(x: 4, y: 1)

let result = first + second
// = (x: 6, y: 3)

class Tree <T> {
    // 'T' can now be used as a type
    var value : T
    var children: [Tree<T>] = []
    
    init(value: T) {
        self.value = value
    }
    
    func addChild(value: T) -> Tree<T> {
        let newChild = Tree<T>(value: value)
        children.append(newChild)
        return newChild
    }
}

// Tree of integers
let integerTree = Tree<Int>(value: 5)

// Can add children that contain Ints
integerTree.addChild(10)
integerTree.addChild(5)

// Tree of strings
let stringTree = Tree<String>(value: "Hello")

stringTree.addChild("Yes")
stringTree.addChild("Internets")

var view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
view.bounds
view.pointInside(CGPoint(x: 20, y: 20), withEvent: nil) // = true

class Class1 {
    init() {
        println("Class 1 being created!")
    }
    
    deinit {
        println("Class 1 going away!")
    }
}

class Class2 {
    // Weak vars are implicitly optional
    weak var weakRef : Class1?
}

let emptyString = ""
let anotherEmptyString = String()
emptyString.isEmpty // = true

var composingAString = "Hello"
composingAString += ", World!" // = Hello, World!"

var reversedString = ""
for character in "Hello" {
    reversedString = String(character) + reversedString
}
reversedString // = "olleH"

countElements("Hello") // = 5

let string1: String = "Hello"
let string2: String = "Hel" + "lo"

if string1 == string2 {
    println("The strings are equal")
}

if string1 as AnyObject === string2 as AnyObject {
    println("The strings are the same object")
}

string1.uppercaseString // = "HELLO"
string2.lowercaseString // = "hello"

if string1.hasPrefix("H") {
    println("String begins with an H")
}
if string1.hasSuffix("llo") {
    println("String ends in 'llo'")
}

let stringToConvert = "Hello, Swift"
let data = stringToConvert.dataUsingEncoding(NSUTF8StringEncoding)

// Loading from URL 
if let fileURL = NSBundle.mainBundle().URLForResource("SomeFile", withExtension: "txt") {
    let loadedDataFromURL = NSData(contentsOfURL: fileURL)
}

// Loading from a file
if let filePath = NSBundle.mainBundle().pathForResource("SomeFile", ofType: "txt") {
    let loadedDataFromPath = NSData(contentsOfFile: filePath)
}

class SerializableObject : NSObject, NSCoding {
    var name: String?
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name!, forKey:"name")
    }
    override init() {
        self.name = "My Object"
    }
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as? String
    }
}

let anObject = SerializableObject()

anObject.name = "My Thing That I'm Saving"

// Converting it to data
let objectConvertedToData = NSKeyedArchiver.archivedDataWithRootObject(anObject)

// Converting it back
// Note that the conversion might fail, so 'unarchiveObjectWithData' returns
// an optional value. So use 'as?' to check to see if it worked.
let loadedObject = NSKeyedUnarchiver.unarchiveObjectWithData(objectConvertedToData) as? SerializableObject

loadedObject?.name
// = "My Thing That I'm Saving"

// Define a protocol that has a function called handleIntruder
protocol HouseSecurityDelegate {
    // We don't define the function here, but rather
    // indicate that any class that is a HouseSecurityDelegate
    // is required ot have a handleIntruder() function
    func handleIntruder()
}

class House {
    // The delegate can be any object that conforms to the HouseSecurityDelegate
    // protocol
    var delegate: HouseSecurityDelegate?
    
    func burglarDetected() {
        // Check to see if the delegate is there, then call it
        delegate?.handleIntruder()
    }
}

class GuardDog : HouseSecurityDelegate {
    func handleIntruder() {
        println("Releasing the hounds!")
    }
}

let myHouse = House()
myHouse.burglarDetected() // does nothing

let theHounds = GuardDog()
myHouse.delegate = theHounds
myHouse.burglarDetected() // prints "Releasing the hounds!"
