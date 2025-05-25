//
//  maxRainTapWater.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/26/25.
//

/*
 https://leetcode.com/problems/trapping-rain-water/description/
 
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

  

 Example 1:


 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 Example 2:

 Input: height = [4,2,0,3,2,5]
 Output: 9
  

 Constraints:

 n == height.length
 1 <= n <= 2 * 104
 0 <= height[i] <= 105
 */

import Foundation

func trap(_ height: [Int]) -> Int {
    if height.count == 0 { return 0 }
    var maxArea = 0
    var lMax = 0
    var rMax = 0
    var left = 0
    var right = height.count - 1
    while( left < right)
    {
        lMax = max(lMax, height[left])
        rMax = max(rMax, height[right])
        if lMax < rMax {
            maxArea += lMax - height[left]
            left += 1
        } else {
            maxArea += rMax - height[right]
            right -= 1
        }
    }
    return maxArea
}
