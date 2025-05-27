//
//  multiSet.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/15/25.
//

import Foundation

class multiSet<T:Comparable & Hashable> {
    
    var hashMap = [T:Int]()
    var count = 0
    
    func add(element:T) {
        if let val = hashMap[element] {
            hashMap[element] = val + 1
        } else {
            hashMap[element] = 1
        }
        count += 1
    }
    
    func remove(element:T) {
        if let val = hashMap[element] {
            if val == 1 {
                hashMap.removeValue(forKey: element)
            } else {
                hashMap[element] = val - 1
            }
            count -= 1
        }
        
    }
    
    func countOf(element:T) -> Int {
        if let val = hashMap[element] {
            return val
        }
        return 0
    }
    
    func countAll() -> Int {
        return count
    }
    
}
