/*
 
 tags:Google
 
 146. LRU Cache
 
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

public class Node {
    public var key: Int
    public var val: Int
    public var next: Node?
    public var prev: Node?
    public init(_ key: Int, _ val: Int) { self.key = key; self.val = val; }
}

class LRUCache {
    private var dict: [Int: Node]
    var capacity: Int
    var total: Int
    var head, tail: Node?

    init(_ capacity: Int) {
        self.capacity = capacity
        total = 0
        head = Node(0, 0)
        tail = Node(0, 0)
        head!.prev = nil
        head!.next = tail
        tail!.prev = head
        tail!.next = nil
        dict = [:]
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            let result = node.val
            delete(node)
            addToHead(node)
            print("Got \(result) for key: \(key)")
            return result
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ val: Int) {
        if let node = dict[key] {
            node.val = val
            delete(node)
            addToHead(node)
        } else {
            let node = Node(key, val)
            dict[key] = node
            addToHead(node)
            total += 1
            if total > capacity {
                dict[tail!.prev!.key] = nil
                delete(tail!.prev!)
                total -= 1
            }
        }
    }
    
    func delete(_ node: Node) {
        node.prev!.next = node.next
        node.next!.prev = node.prev
    }
    
    func addToHead(_ node: Node) {
        node.prev = head
        node.next = head!.next
        head!.next!.prev = node
        head!.next = node
    }
}

/*
let lRUCache = LRUCache(2)
lRUCache.get(2)
lRUCache.put(2, 6)
lRUCache.get(1)
lRUCache.put(1, 5)
lRUCache.put(1, 2)
lRUCache.get(1)
lRUCache.get(2)
lRUCache.put(3, 103)
lRUCache.get(1)
lRUCache.get(3)
*/


let lRUCache = LRUCache(3)
lRUCache.put(1, 101)
lRUCache.put(2, 102)
lRUCache.put(3, 103)
lRUCache.put(4, 104)
lRUCache.get(4)
lRUCache.put(5, 105)
lRUCache.get(2)
