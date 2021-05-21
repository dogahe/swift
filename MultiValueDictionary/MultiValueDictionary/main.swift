//
//  main.swift
//  MultiValueDictionary
//
//  Created by Behzad Dogahe on 5/12/21.
//

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
    /*
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
 */
}
// Start typing here

struct MyDict<Key: Hashable, Value: Equatable> : MultiValueDictionary {
    typealias Iterator = Dictionary<Key, [(Key, Value)]>.Iterator
    
    
    //typealias Element = (Key, Value)

    
    
    var dict: [Key: [(Key, Value)]] = [:]

    


    func makeIterator() -> Dictionary<Key, [(Key, Value)]>.Iterator {
        return dict.makeIterator()
   }

    
    
    
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

