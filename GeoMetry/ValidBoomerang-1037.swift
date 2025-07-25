//
//  ValidBoomerang-1037.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/25/25.
/*
 https://leetcode.com/problems/valid-boomerang/description/?envType=problem-list-v2&envId=math
 
 Given an array points where points[i] = [xi, yi] represents a point on the X-Y plane, return true if these points are a boomerang.

 A boomerang is a set of three points that are all distinct and not in a straight line.

  

 Example 1:

 Input: points = [[1,1],[2,3],[3,2]]
 Output: true
 Example 2:

 Input: points = [[1,1],[2,2],[3,3]]
 Output: false
  

 Constraints:

 points.length == 3
 points[i].length == 2
 0 <= xi, yi <= 100

 */

func isBoomerang(_ points: [[Int]]) -> Bool {
    
    func getSlope(_ p1:[Int], _ p2:[Int] ) -> (Int, Int) {
        return (p2[1]-p1[1], p2[0]-p1[0])
    }
    
    let (dy1, dx1) = getSlope(points[0], points[1])
    let (dy2, dx2) = getSlope(points[1], points[2])
    
    return dy1*dx2 != dy2*dx1
}
