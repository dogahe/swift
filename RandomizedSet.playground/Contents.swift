/*
 
 tags:Google
 
 380. Insert Delete GetRandom O(1)
 
 Implement the RandomizedSet class:
 
 RandomizedSet() Initializes the RandomizedSet object.
 bool insert(int val) Inserts an item val into the set if not present. Returns true if the item was not present, false otherwise.
 bool remove(int val) Removes an item val from the set if present. Returns true if the item was present, false otherwise.
 int getRandom() Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the same probability of being returned.
 
 
 Example 1:
 
 Input
 ["RandomizedSet", "insert", "remove", "insert", "getRandom", "remove", "insert", "getRandom"]
 [[], [1], [2], [2], [], [1], [2], []]
 Output
 [null, true, false, true, 2, true, false, 2]
 
 Explanation
 RandomizedSet randomizedSet = new RandomizedSet();
 randomizedSet.insert(1); // Inserts 1 to the set. Returns true as 1 was inserted successfully.
 randomizedSet.remove(2); // Returns false as 2 does not exist in the set.
 randomizedSet.insert(2); // Inserts 2 to the set, returns true. Set now contains [1,2].
 randomizedSet.getRandom(); // getRandom() should return either 1 or 2 randomly.
 randomizedSet.remove(1); // Removes 1 from the set, returns true. Set now contains [2].
 randomizedSet.insert(2); // 2 was already in the set, so return false.
 randomizedSet.getRandom(); // Since 2 is the only number in the set, getRandom() will always return 2.
 
 
 Constraints:
 
 -231 <= val <= 231 - 1
 At most 105 calls will be made to insert, remove, and getRandom.
 There will be at least one element in the data structure when getRandom is called.
 
 
 Follow up: Could you implement the functions of the class with each function works in average O(1) time?
 
 */

// With taking advantage of dict.randomElement()
/*
 class RandomizedSet {
 
 var dict: [Int: Bool]
 /** Initialize your data structure here. */
 init() {
 dict = [:]
 }
 
 /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
 func insert(_ val: Int) -> Bool {
 if let v = dict[val], v {
 return false
 } else {
 dict[val] = true
 return true
 }
 }
 
 /** Removes a value from the set. Returns true if the set contained the specified element. */
 func remove(_ val: Int) -> Bool {
 if let v = dict[val], v {
 dict[val] = nil
 return true
 } else {
 return false
 }
 }
 
 /** Get a random element from the set. */
 func getRandom() -> Int {
 let element = dict.randomElement()!
 return element.key
 }
 }
 */

// Without taking advantage of dict.randomElement()

class RandomizedSet {
    
    var dict: [Int: Int]
    var arr: [Int]
    /** Initialize your data structure here. */
    init() {
        dict = [:]
        arr = []
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if dict[val] != nil {
            return false
        } else {
            arr.append(val)
            dict[val] = arr.count - 1
            return true
        }
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if let index = dict[val] {
            dict[val] = nil
            if index == arr.count - 1 {
                arr.removeLast()
            } else {
                arr[index] = arr[arr.count - 1]
                arr.removeLast()
                dict[arr[index]] = index
            }
            return true
        } else {
            return false
        }
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        let n = Int.random(in: 0 ..< arr.count)
        let element = arr[n]
        return element
    }
}

let obj = RandomizedSet()

/*
 obj.insert(3)
 obj.insert(3)
 obj.getRandom()
 obj.getRandom()
 obj.insert(1)
 obj.remove(3)
 obj.getRandom()
 obj.getRandom()
 */
obj.insert(1)
obj.insert(0)
obj.remove(0)

/*
 let ret_1: Bool = obj.insert(1)
 let ret_2: Bool = obj.insert(2)
 let ret_3: Bool = obj.remove(1)
 let ret_5: Int = obj.getRandom()
 
 */
