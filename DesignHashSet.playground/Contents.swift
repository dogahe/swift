//  Design a HashSet without using any built-in hash table libraries.
//  To be specific, your design should include these functions:
//  add(value): Insert a value into the HashSet.
//  contains(value) : Return whether the value exists in the HashSet or not.
//  remove(value): Remove a value in the HashSet. If the value does not exist in the HashSet, do nothing.

class MyHashSet {
    
    private var container: [Int: Int]
    init() {
        container = [:]
    }
    
    func add(_ key: Int) {
        container[key] = key
    }
    
    func remove(_ key: Int) {
        container[key] = nil
    }
    
    func contains(_ key: Int) -> Bool {
        return container[key] != nil
    }
}

let obj = MyHashSet()
obj.add(3)
obj.contains(3)
obj.contains(1)
obj.contains(2)
obj.add(2)
obj.contains(2)
obj.remove(2)
obj.contains(2)


