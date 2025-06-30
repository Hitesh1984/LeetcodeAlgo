//
//  LargestNumber-179.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/15/25.
//

/*
 https://leetcode.com/problems/largest-number/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a list of non-negative integers nums, arrange them such that they form the largest number and return it.

 Since the result may be very large, so you need to return a string instead of an integer.

  

 Example 1:

 Input: nums = [10,2]
 Output: "210"
 Example 2:

 Input: nums = [3,30,34,5,9]
 Output: "9534330"
  

 Constraints:

 1 <= nums.length <= 100
 0 <= nums[i] <= 109

 */

import Collections

struct Num:Comparable {
    let num:String
    static func < (lhs: Num, rhs:Num) -> Bool {
        return lhs.num + rhs.num < rhs.num + lhs.num
    }
}

func largestNumber(_ nums: [Int]) -> String {
    if nums.allSatisfy { $0 == 0 } {
        return "0"
    }
    var heap = Heap<Num>()
    var res: String = ""
    for  num in nums {
        let n1 = Num(num:String(num))
        heap.insert(n1)
    }
    while !heap.isEmpty{
        let n1 = heap.popMax()!
        res.append(n1.num)
    }
    return res
}

