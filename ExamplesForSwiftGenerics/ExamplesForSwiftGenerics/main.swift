//
//  main.swift
//  ExamplesForSwiftGenerics
//
//  Created by Behzad Dogahe on 5/12/21.
//


func addInts(x: Int, y: Int) -> Int {
  return x + y
}

let intSum = addInts(x: 1, y: 2)
print(intSum)

let numbers = [1, 2, 3]

let firstNumber = numbers[0]


var numbersAgain: Array<Int> = []
numbersAgain.append(1)
numbersAgain.append(2)
numbersAgain.append(3)

let firstNumberAgain = numbersAgain[0]

let optionalName = Optional<String>.some("Princess Moana")
if let name = optionalName {}

struct Queue<Element> {
    private var elements: [Element] = []
    
    mutating func enqueue(newElement: Element) {
        elements.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else { return nil }
        return elements.remove(at: 0)
    }
}

var q = Queue<Int>()

q.enqueue(newElement: 1)
q.enqueue(newElement: 2)

print(q.dequeue())
print(q.dequeue())
print(q.dequeue())
print(q.dequeue())

func pairs<Key, Value>(from dictionary: [Key: Value]) -> [(Key, Value)] {
  return Array(dictionary)
}

let somePairs = pairs(from: ["minimum": 199, "maximum": 299])
print(somePairs)
// result is [("maximum", 299), ("minimum", 199)]

let morePairs = pairs(from: [1: "Swift", 2: "Generics", 3: "Rule"])
print(morePairs)
// result is [(1, "Swift"), (2, "Generics"), (3, "Rule")]

func mid<T: Comparable>(array: [T]) -> T? {
    guard !array.isEmpty else { return nil }
    return array.sorted()[(array.count - 1) / 2]
}

print(mid(array: [3, 5, 1, 2, 4])) // 3

protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}

func add<T: Summable>(x: T, y: T) -> T {
  return x + y
}

extension Int: Summable {}
extension Double: Summable {}

let addIntSum = add(x: 1, y: 2) // 3
let addDoubleSum = add(x: 1.0, y: 2.0) // 3.0
print(addIntSum, addDoubleSum)

extension String: Summable {}
let addString = add(x: "Generics", y: " are Awesome!!! :]")
print(addString)


extension Queue {
  func peek() -> Element? {
    return elements.first
  }
}

q.enqueue(newElement: 5)
q.enqueue(newElement: 3)
print(q.peek()) // 5

class Box<T> {
  // Just a plain old box.
}

class Gift<T>: Box<T> {
  // By default, a gift box is wrapped with plain white paper
  func wrap() {
    print("Wrap with plain white paper.")
  }
}

class Rose {
  // Flower of choice for fairytale dramas
}

class ValentinesBox: Gift<Rose> {
  // A rose for your valentine
    override func wrap() {
      print("Wrap with ♥♥♥ paper.")
    }
}

class Shoe {
  // Just regular footwear
}

class GlassSlipper: Shoe {
  // A single shoe, destined for a princess
}

class ShoeBox: Box<Shoe> {
  // A box that can contain shoes
}

let box = Box<Rose>() // A regular box that can contain a rose
let gift = Gift<Rose>() // A gift box that can contain a rose
let shoeBox = ShoeBox()

let valentines = ValentinesBox()

gift.wrap() // plain white paper
valentines.wrap() // ♥♥♥ paper

enum Reward<T> {
  case treasureChest(T)
  case medal

  var message: String {
    switch self {
    case .treasureChest(let treasure):
      return "You got a chest filled with \(treasure)."
    case .medal:
      return "Stand proud, you earned a medal!"
    }
  }
}


let message = Reward.treasureChest("💰").message
print(message)


let animals = ["Antelope", "Butterfly", "Camel", "Dolphin"]
for animal in animals {
    print(animal)
}

var animalIterator = animals.makeIterator()
while let animal = animalIterator.next() {
    print(animal)
}

// https://leetcode.com/discuss/interview-question/416544/Google-or-iOS-Phone-Screen-or-Linked-List-iterator

class LinkedListNode<T> {
    let value: T
    var next: LinkedListNode?

    init(_ value: T) {
        self.value = value
    }
    
    init(_ value: T, next: LinkedListNode?) {
        self.value = value
        self.next = next
    }
}

extension LinkedListNode: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(self)
   }
}

class LinkedListIterator<T>: IteratorProtocol {
    var current: LinkedListNode<T>?
    
    init(_ node: LinkedListNode<T>) {
        self.current = node
    }
    
    
    func next() -> LinkedListNode<T>? {
        let result = current
        current = current?.next
        return result
    }
    
    /*
    func next() -> T? {
        let result = current
        current = current?.next
        return result?.value
    }
 */
}

var myList = LinkedListNode<Int>(7, next: LinkedListNode<Int>(8,  next: LinkedListNode<Int>(10, next:  LinkedListNode<Int>(6))))
for item in myList {
    print(item.value)
}


if var num = Int("12fdf3") {
    num *= 2
    print(num)
} else {
    print("Not an integer!")
}
