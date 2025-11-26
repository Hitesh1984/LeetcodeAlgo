//
//  smallestRange-2-910.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 10/3/25.
/*
 https://leetcode.com/problems/smallest-range-ii/description/?envType=problem-list-v2&envId=math
 
 You are given an integer array nums and an integer k.

 For each index i where 0 <= i < nums.length, change nums[i] to be either nums[i] + k or nums[i] - k.

 The score of nums is the difference between the maximum and minimum elements in nums.

 Return the minimum score of nums after changing the values at each index.

  

 Example 1:

 Input: nums = [1], k = 0
 Output: 0
 Explanation: The score is max(nums) - min(nums) = 1 - 1 = 0.
 Example 2:

 Input: nums = [0,10], k = 2
 Output: 6
 Explanation: Change nums to be [2, 8]. The score is max(nums) - min(nums) = 8 - 2 = 6.
 Example 3:

 Input: nums = [1,3,6], k = 3
 Output: 3
 Explanation: Change nums to be [4, 6, 3]. The score is max(nums) - min(nums) = 6 - 3 = 3.
  

 Constraints:

 1 <= nums.length <= 104
 0 <= nums[i] <= 104
 0 <= k <= 104
 */

func smallestRangeII(_ nums: [Int], _ k: Int) -> Int {
    var sortedNums = nums;
    sortedNums.sort();
    let n = nums.count;
    var tempMin = sortedNums[0];
    var tempMax = sortedNums[n-1];
    var tempDiff = tempMax - tempMin;
    for i in 1..<n {
        tempMin = min(sortedNums[0] + k, sortedNums[i] - k);
        tempMax = max(sortedNums[i - 1] + k, sortedNums[n-1]-k);
        tempDiff = min(tempDiff, tempMax - tempMin);
    }
    return tempDiff;
}
