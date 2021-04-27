/*
 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 Follow up:
 Could you do get and put in O(1) time complexity?

  

 Example 1:

 Input
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 Output
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 Explanation
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // cache is {1=1}
 lRUCache.put(2, 2); // cache is {1=1, 2=2}
 lRUCache.get(1);    // return 1
 lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
 lRUCache.get(2);    // returns -1 (not found)
 lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
 lRUCache.get(1);    // return -1 (not found)
 lRUCache.get(3);    // return 3
 lRUCache.get(4);    // return 4
  

 Constraints:

 1 <= capacity <= 3000
 0 <= key <= 3000
 0 <= value <= 104
 At most 3 * 104 calls will be made to get and put.
 */

class LRUCache {

    var capacity: Int
    var total: Int
    private var dict: [Int: (Int, Int)]
    var t: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
        total = 0
        t = 0
        dict = [:]
    }
    
    func get(_ key: Int) -> Int {
        if let val = dict[key] {
            t += 1
            dict[key] = (val.0, t)
            return val.0
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if total < capacity {
            if let val = dict[key] {
                t += 1
                dict[key] = (value, t)
            } else {
                t += 1
                dict[key] = (value, t)
                total += 1
            }
        } else {
            // Only need to remove if  we are adding a new  key
            if let val = dict[key] {
                t += 1
                dict[key] = (value, t)
            } else {
                var smallestT: Int = Int.max
                var smallestKey: Int?
                for (index, (key, val)) in dict.enumerated() {
                    let currT = val.1
                    if currT < smallestT {
                        smallestT = currT
                        smallestKey = key
                    }
                }
                if let smallestKey = smallestKey {
                    dict[smallestKey] = nil
                    total -= 1
                }
                t += 1
                dict[key] = (value, t)
                total += 1
            }
        }
    }
}

let lRUCache = LRUCache(2)
lRUCache.get(2)
lRUCache.put(2, 6)
lRUCache.get(1)
lRUCache.put(1, 5)
lRUCache.put(1, 2)
lRUCache.get(1)
lRUCache.get(2)


/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
