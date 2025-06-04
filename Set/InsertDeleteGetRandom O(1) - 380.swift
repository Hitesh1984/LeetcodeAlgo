//
//  InsertDeleteGetRandom O(1).swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/19/25.
//

import Foundation

class RandomizedSet {

    var map : Set<Int>
    init() {
        map = []
    }
    
    func insert(_ val: Int) -> Bool {
       return map.insert(val).inserted
    }
    
    func remove(_ val: Int) -> Bool {
        return (map.remove(val) != nil)
    }
    
    func getRandom() -> Int {
        return map.randomElement() ?? 0
    }
}

