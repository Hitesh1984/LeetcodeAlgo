//
//  LRUCache-146.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/30/25.
//

/*
 https://leetcode.com/problems/lru-cache/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 The functions get and put must each run in O(1) average time complexity.

  

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
 0 <= key <= 104
 0 <= value <= 105
 At most 2 * 105 calls will be made to get and put.
 */
//import Foundation
import OrderedCollections


//private class Node {
//        let val: Int
//        let key: Int
//
//        var left: Node?
//        var right: Node?
//
//        init(_ key: Int, _ val: Int, _ left: Node? = nil, _ right: Node? = nil) {
//            self.key = key
//            self.val = val
//            self.left = left
//            self.right = right
//        }
//}

class Node:Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.key == rhs.key && lhs.val == rhs.val && lhs.prev == rhs.prev && lhs.next == rhs.next
    }
    var key: Int
    var val: Int
    var prev: Node?
    var next: Node?
    init(key: Int, val: Int) {
        self.key = key
        self.val = val
    }
    
}

class LRUCache {
    private let capacity:Int
    private var head:Node?
    private var tail:Node?
    private var cache: [Int:Node] = [:]
    private var count = 0
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let cur = cache[key] else {
            return -1
        }
        moveToHead(cur)
        return cur.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.val = value
            moveToHead(node)
        } else {
            let node = Node(key: key, val: value)
            node.next = head
            head?.prev = node
            head = node
            cache[key] = node
            count += 1
            if tail == nil {
                tail = head
            }
        }
        if count > capacity {
            cache.removeValue(forKey: tail!.key)
            tail = tail?.prev
            tail?.next = nil
            count -= 1
        }
    }
    
    func moveToHead(_ node: Node) {
        if node === head {
            return
        } else {
            node.prev?.next = node.next
            node.next?.prev = node.prev
            node.next = head
            head?.prev = node
            head = node
        }
        if node === tail {
            tail = tail?.prev
            tail?.next = nil
        }
    }
}

class LRUCache2 {
    var capacity: Int
    var cache = OrderedDictionary<Int, Int>()
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    func get(_ key: Int) -> Int {
        if let value = cache.removeValue(forKey: key) {
            cache[key] = value
            return value
        } else { return -1 }
    }
    func put(_ key: Int, _ value: Int) {
        if let _ = cache.removeValue(forKey: key)  {
            cache[key] = value
        } else {
            if cache.count == capacity {
                cache.removeValue(forKey: cache.keys.first!)
            }
            cache[key] = value
        }
    }
}
