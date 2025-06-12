//
//  justCHeck.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/27/25.
//

import Foundation
import Collections
//import HashTreeCollections
import Algorithms

/*
 
 https://leetcode.com/problems/sliding-window-maximum/description/
 
 You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.

 Return the max sliding window.

  

 Example 1:

 Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
 Output: [3,3,5,5,6,7]
 Explanation:
 Window position                Max
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]
  

 Constraints:

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 1 <= k <= nums.length

 */
 
 



 struct Element: Comparable {
     let val: Int
     let index: Int

     public static func <(lhs: Element, rhs: Element) -> Bool {
         (lhs.val, lhs.index) < (rhs.val, rhs.index)
     }
 }
  
// Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
//Output: [3,3,5,5,6,7]
  

// ([1,3,1,2,0,5], 3)
func maxSlidingWindowWithHeap(_ nums: [Int], _ k: Int) -> [Int] {
    var heap = Heap<Element>()
    var res = [Int]()
    
    for (i, val) in nums.enumerated() {
        heap.insert(Element(val: val, index: i))
        
        // Accumulate k elements first.
        if i < k - 1 { continue }
        
        // Pop max elements that are outside the window
        while i - heap.max!.index >= k {
            
            print(heap.max)
            print(heap.max!.index)
            heap.popMax()
        }
        
        // Add the max element to the result.
        res.append(heap.max!.val)
    }
    
    return res
}



 
 
