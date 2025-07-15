//
//  sortAnArray-912.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/14/25.
/*
 https://leetcode.com/problems/sort-an-array/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array of integers nums, sort the array in ascending order and return it.

 You must solve the problem without using any built-in functions in O(nlog(n)) time complexity and with the smallest space complexity possible.

  

 Example 1:

 Input: nums = [5,2,3,1]
 Output: [1,2,3,5]
 Explanation: After sorting the array, the positions of some numbers are not changed (for example, 2 and 3), while the positions of other numbers are changed (for example, 1 and 5).
 Example 2:

 Input: nums = [5,1,1,2,0,0]
 Output: [0,0,1,1,2,5]
 Explanation: Note that the values of nums are not necessarily unique.
  

 Constraints:

 1 <= nums.length <= 5 * 104
 -5 * 104 <= nums[i] <= 5 * 104
 */

func sortArray(_ nums: [Int]) -> [Int] {
    if nums.count < 2 { return nums }
    let mid = nums.count / 2
    let count = nums.count
    let left = sortArray(Array(nums[0..<mid]))
    let right = sortArray(Array(nums[mid..<count]))
    return mergeSort(left,right)
    
    func mergeSort(_ left: [Int], _ right: [Int]) -> [Int] {
        var sorted = [Int]()
        var left = left
        var right = right
        while !left.isEmpty && !right.isEmpty {
            if left[0] < right[0] {
                sorted.append(left[0])
                left.remove(at:0)
            } else {
                sorted.append(right[0])
                right.remove(at:0)
            }
        }
        return sorted + left + right
    }
}
