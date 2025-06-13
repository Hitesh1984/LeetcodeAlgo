//
//  kFrequentElement.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/2/25.
//
/*
 https://leetcode.com/problems/top-k-frequent-elements/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

  

 Example 1:

 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]
  

 Constraints:

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 k is in the range [1, the number of unique elements in the array].
 It is guaranteed that the answer is unique.
 */
import Foundation
import Collections

func getKthFrequentNumber(inputArray: inout [Int], kth:Int) -> [Int]
{
    if inputArray.count == 0 {
        return [-1]
    }
    if inputArray.count < kth {
        return [-1]
    }
    var counterHashMap = [Int:Int]()
    var frequencyHashMap = [Int:[Int]]()
    for n in inputArray {
        if let value = counterHashMap[n] {
            counterHashMap[n] = value + 1
        } else {
            counterHashMap[n] = 1
        }
    }
    for (key,value) in counterHashMap {
        if let _ = frequencyHashMap[value] {
            frequencyHashMap[value]?.append(key)
        } else {
            frequencyHashMap[value] = [key]
        }
    }
   var result = [Int]()
    for i in stride(from: inputArray.count, through: 1, by: -1) {
        for value in frequencyHashMap[i] ?? [] {
            result.append(value)
            if result.count == kth {
                return result
            }
        }
    }
    
    
    
    
    return [-1]
    
}

struct NumFreq:Comparable {
    let num:Int
    let freq:Int
    
    static func < (lhs:NumFreq, rhs:NumFreq) -> Bool {
        lhs.freq < rhs.freq
    }
    
    
}
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var numDict = nums.reduce(into: [:]) {
        $0[$1, default: 0] += 1
    }
    var heap:Heap<NumFreq> = []
    
    for(num, freq) in numDict {
        heap.insert(NumFreq(num: num, freq: freq))
        if heap.count > k {
            heap.removeMin()
        }
    }

    return heap.unordered.map{ $0.num }
}




/*
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    let numsDict = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var heap: Heap<NumFreq> = []
    
    for (num, freq) in numsDict {
        heap.insert(NumFreq(num: num, freq: freq))
        if heap.count > k {
            heap.removeMin()
        }
    }
    
    return heap.unordered.map { $0.num }
}

struct NumFreq: Comparable {
    let num: Int
    let freq: Int
    
    static func < (lhs: NumFreq, rhs: NumFreq) -> Bool {
        lhs.freq < rhs.freq
    }
}
*/
