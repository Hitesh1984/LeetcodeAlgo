//
//  maxPointsOnLine-149.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/4/25.
/*
 https://leetcode.com/problems/max-points-on-a-line/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.

  

 Example 1:


 Input: points = [[1,1],[2,2],[3,3]]
 Output: 3
 Example 2:


 Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
 Output: 4
  

 Constraints:

 1 <= points.length <= 300
 points[i].length == 2
 -104 <= xi, yi <= 104
 All the points are unique.
 
 */

func maxPoints(_ points: [[Int]]) -> Int {
    if (points.count == 0 || points.count == 1) {
        return points.count
    }
    var maxPoints = 1
    for i in 0..<points.count {
        var slopeDict = [Double:Int]()
        for j in i+1..<points.count {
            let p1 = points[i]
            let p2 = points[j]
            var slope = Double(Int.max)
            if(p1[0] != p2[0]) {
                slope = (Double(p1[1] - p2[1]))/Double((p1[0] - p2[0]))
            }
            slopeDict[slope, default: 0] += 1
            maxPoints  = max(maxPoints, slopeDict[slope]! + 1)
        }
    }
    return maxPoints
}
