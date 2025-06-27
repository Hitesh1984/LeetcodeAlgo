//
//  File.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/26/25.
//

import Foundation

func minimumOperations123(_ nums: [Int]) -> Int {
    var nums = nums
    var res = 0
    while !nums.isEmpty && nums.count != Set(nums).count {
        if nums.count >= 3 {
            nums.removeSubrange(0...2)
        } else {
            nums.removeAll()
        }
        res += 1
    }
    return res
}


/*
func minimumOperations123(_ nums: [Int]) -> Int {
    var res = 0
    var map = [Int:Int]()
    for num in nums { map[num, default:0] += 1 }
    if map.keys.count == nums.count { return 0 }
    var nums = nums
    while nums.count != map.keys.count && nums.count >= 3 {
        res += 1
        for _ in 0...2 {
            let first = nums.removeFirst()
            let val = map[first, default:0]
            if val == 1 {
                map.removeValue(forKey:first)
            } else {
                map[first, default:0]  -= 1
            }
        }
    }
    if nums.count > 0 &&  nums.count != map.keys.count {
        res += 1
    }
    return res
}
*/
