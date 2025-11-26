//
//  setMismatch-645.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 11/17/25.
//

/*
 https://leetcode.com/problems/set-mismatch/description/?envType=problem-list-v2&envId=array
 
 You have a set of integers s, which originally contains all the numbers from 1 to n. Unfortunately, due to some error, one of the numbers in s got duplicated to another number in the set, which results in repetition of one number and loss of another number.

 You are given an integer array nums representing the data status of this set after the error.

 Find the number that occurs twice and the number that is missing and return them in the form of an array.

  

 Example 1:

 Input: nums = [1,2,2,4]
 Output: [2,3]
 Example 2:

 Input: nums = [1,1]
 Output: [1,2]
  

 Constraints:

 2 <= nums.length <= 104
 1 <= nums[i] <= 104
 */

func findErrorNums(_ nums: [Int]) -> [Int] {
    var numAndFrequency: [Int: Int] = [:]
    for num in nums {
        numAndFrequency[num, default:0] += 1
    }
    var duplicatedNum = 0
    var missedNum = 0
    for num in 1...nums.count {
        let frequency = numAndFrequency[num, default:0]
        if frequency > 1 {
            duplicatedNum = num
        } else if frequency == 0 {
            missedNum = num
        }
        if duplicatedNum > 0, missedNum > 0 {
            break
        }
    }
    return [duplicatedNum, missedNum]
}
