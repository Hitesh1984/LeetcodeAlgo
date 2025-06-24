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
        hashMap[element, default: 0] += 1
        count += 1
    }
    
    func remove(element:T) {
        if hashMap[element, default: 0] == 1 {
            hashMap.removeValue(forKey: element)
            count -= 1
        } else if hashMap[element, default: 0] > 1 {
            hashMap[element, default: 0] -= 1
            count -= 1
        }
    }
    
    func countOf(element:T) -> Int {
        return hashMap[element, default: 0]
    }
    
    func countAll() -> Int {
        return count
    }
    
}
