//
//  main.swift
//  MultiValueDictionary
//
//  Created by Behzad Dogahe on 5/12/21.
//

/*
Implement the generic MultiValueDictionary<Key, Value> protocol
It can be viewed as a Dictionary that allows multiple values for any given unique key.
Each key in MultiValueDictionary can contain only unique values.
Also getting the value for a key returns a sequence of values (AnySequence<Value>) rather than a single value associated with that key.

Examples:
*/

/*
var creatures = MultiValueDictionary<String, String>()
 
creatures.addElement(withKey: "birds", andValue: "eagle")
creatures.addElement(withKey: "birds", andValue: "dove")
creatures.addElement(withKey: "animals", andValue: "tiger")
creatures.addElement(withKey: "fish", andValue: "shark")
 
let birds = creatures.getValues(forKey: "birds") // birds has 2 values: "eagle" and "dove"

creatures = MultiValueDictionary<String, String>()
creatures.addElement(withKey: "animals", andValue: "tiger")
creatures.addElement(withKey: "animals", andValue: "tiger") // it doesn't add "tiger" to "animals" again since "tiger" already exists
let animals = creatures.getValues(forKey: "animals") // animals has only 1 value and it is "tiger"
*/

import Foundation

// Works like a normal dictionary, but each key can be associated
// with multiple, but unique (per key) values. Keys in the dictionary
// should only be valid if they have at least 1 associated value at all times.
protocol MultiValueDictionary : Sequence where Element == (Key, Value) {
    associatedtype Key
    associatedtype Value
    
    // Returns true if the collection is modified; false otherwise.
    // Must return false if (key, value) pair already exists in the dictionary.
    mutating func addElement(withKey: Key, andValue: Value) -> Bool
    
    // Returns any iterable sequence of values associated to a key or nil if key
    // is not in dictionary
    func getValues(forKey: Key) -> AnySequence<Value>?
    
    // Removes and returns key value tuple if exist, otherwise returns nil
    mutating func removeElement(forKey: Key, andValue: Value) -> (Key, Value)?
    
    // Removes all values associated to a key and returns them as any iterable
    // sequence or just returns nil if key is not in the dictionary
    mutating func removeValues(forKey: Key) -> AnySequence<Value>?
    
    // For conformance to the Sequence protocal your type will also have
    // to implement its own makeIterator() method so the dictionary
    // itself can be iterated (such as with a for loop) returning tuples
    // of key/value pairs on each iteration
}

struct MyDict<MyValue: Equatable>: MultiValueDictionary, Sequence, IteratorProtocol {
    typealias Key = String
    typealias Value = MyValue
    
    var current: (Key, Value)?
    
    var dict: [Key: [Value]] = [:]
    
    mutating func next() -> (Key, Value)? {
        return nil
    }

    mutating func addElement(withKey key: Key, andValue value: Value) -> Bool {
        if let val = dict[key] {
            if !val.contains(value) {
                var newVal = val
                newVal.append(value)
                dict[key] = newVal
            } else {
                return false
            }
        } else {
            dict[key] = [value]
        }
        return true
    }
    
    // Returns any iterable sequence of values associated to a key or nil if key
    // is not in dictionary
    func getValues(forKey key: Key) -> AnySequence<Value>? {
        guard let values = dict[key] else { return nil }
        return AnySequence { return values.makeIterator() }
    }
    
    // Removes and returns key value tuple if exist, otherwise returns nil
    mutating func removeElement(forKey: Key, andValue: Value) -> (Key, Value)? {
        return nil
    }
    
    // Removes all values associated to a key and returns them as any iterable
    // sequence or just returns nil if key is not in the dictionary
    mutating func removeValues(forKey: Key) -> AnySequence<Value>? {
        return nil
    }
    
    
    
    //<Key: Hashable, Value: Equatable>
    /*
    typealias Iterator = Dictionary<Key, [(Key, Value)]>.Iterator
    
    typealias Element = (Key, Value)

    
    
    var dict: [Key: [(Key, Value)]] = [:]

    


    func makeIterator() -> Dictionary<Key, [(Key, Value)]>.Iterator {
        return dict.makeIterator()
   }
*/
    
    /*
    
    // Returns true if the collection is modified; false otherwise.
    // Must return false if (key, value) pair already exists in the dictionary.
    mutating func addElement(withKey: Key, andValue: Value) -> Bool {
        
    }
    
    // Returns any iterable sequence of values associated to a key or nil if key
    // is not in dictionary

    func getValues(forKey: Key) -> AnySequence<Value>? {
        
    }
    
    // Removes and returns key value tuple if exist, otherwise returns nil
    mutating func removeElement(forKey: Key, andValue: Value) -> (Key, Value)? {
        
    }
    
    // Removes all values associated to a key and returns them as any iterable
    // sequence or just returns nil if key is not in the dictionary
    mutating func removeValues(forKey: Key) -> AnySequence<Value>? {
        
    }
 */
    /*
    var dict: [Key: [(Key, Value)]] = [:]
    mutating func addElement(withKey key: Key, andValue value: Value) -> Bool {
        if let val = dict[key] {
            if !val.contains((key, value)) {
                var newVal = val
                newVal.append(value)
                dict[key] = newVal
            } else {
                return false
            }
        } else {
            dict[key] = [value]
        }
        return true
    }
    
    func getValues(forKey key: Key) -> [Value]? {//AnySequence<Value>? {
        if let val = dict[key] {
            return val
        }
        return nil
    }
    
    mutating func removeElement(forKey key: Key, andValue value: Value) -> (Key, Value)? {
        if let val = dict[key] {
            if val.contains(value) {
                let index = val.firstIndex(of: value)
                var newVal = val
                newVal.remove(at: index!)
                dict[key] = newVal
                return (key, value)
            }
        }
        return nil
        
    }
    
    mutating func removeValues(forKey key: Key) -> [Value]? { //AnySequence<Value>? {
        if let val = dict[key] {
            dict[key] = nil
            return val
        }
        return nil
    }
 */
    
}


var creatures = MyDict<String>()
 
print(creatures.addElement(withKey: "birds", andValue: "eagle"))
print(creatures.addElement(withKey: "birds", andValue: "dove"))
print(creatures.addElement(withKey: "animals", andValue: "tiger"))
print(creatures.addElement(withKey: "fish", andValue: "shark"))
 
let birds = creatures.getValues(forKey: "birds")
print(birds.map({ $0.map({ $0 }) }))

let fish = creatures.getValues(forKey: "fish")
print(fish.map({ $0.map({ $0 }) }))

for creature in creatures {
    print(creature)
}
