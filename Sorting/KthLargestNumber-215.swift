//
//  KthLargestNumber.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/2/25.
//
/*
 https://leetcode.com/problems/kth-largest-element-in-an-array/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an integer array nums and an integer k, return the kth largest element in the array.
 
 Note that it is the kth largest element in the sorted order, not the kth distinct element.
 
 Can you solve it without sorting?
 
 
 
 Example 1:
 
 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5
 Example 2:
 
 Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
 Output: 4
 
 */
import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    
    var mini = nums.min() ?? 0
    var maxi = nums.max() ?? 0
    var storage: [Int: Int] = nums.reduce(into: [Int: Int]()) { result, value in
        result[value, default:0] += 1
    }
    var count = 0
    for num in (mini...maxi).reversed() {
        
        if let value = storage[num], value > 0 {
            count += value
            if count >= k {
                return num
            }
        }
    }
    return -1
}

/*
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    let target = nums.count - k
    return quickselect(0, nums.count - 1, nums)
    
    func quickselect(_ l: Int,_ r : Int,_ nums: [Int]) -> Int {
        var pivot = nums[r]  // 4
        var p = l // 0
        var a = nums
        for i in l..<r {
            if a[i] <= pivot {
                a.swapAt(p,i)
                p += 1 // p= 3 ,[1,2,3,5,6,4]
            }
        }
        a.swapAt(p, r) // [1,2,3,4,5,6], p = 3
        if p > target {
            return quickselect(l , p-1, a)
        }
        else if p < target {
            return quickselect(p+1 , r, a)
        }
        else {
            return a[p]
        }
    }
}
*/
