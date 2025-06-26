//
//  RectangleOverlap-836.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/26/25.
/*
 https://leetcode.com/problems/rectangle-overlap/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 An axis-aligned rectangle is represented as a list [x1, y1, x2, y2], where (x1, y1) is the coordinate of its bottom-left corner, and (x2, y2) is the coordinate of its top-right corner. Its top and bottom edges are parallel to the X-axis, and its left and right edges are parallel to the Y-axis.

 Two rectangles overlap if the area of their intersection is positive. To be clear, two rectangles that only touch at the corner or edges do not overlap.

 Given two axis-aligned rectangles rec1 and rec2, return true if they overlap, otherwise return false.

  

 Example 1:

 Input: rec1 = [0,0,2,2], rec2 = [1,1,3,3]
 Output: true
 Example 2:

 Input: rec1 = [0,0,1,1], rec2 = [1,0,2,1]
 Output: false
 Example 3:

 Input: rec1 = [0,0,1,1], rec2 = [2,2,3,3]
 Output: false
  

 Constraints:

 rec1.length == 4
 rec2.length == 4
 -109 <= rec1[i], rec2[i] <= 109
 rec1 and rec2 represent a valid rectangle with a non-zero area.
 */

func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
    let xRange1 = rec1[0]..<rec1[2]
    let yRange1 = rec1[1]..<rec1[3]
    let xRange2 = rec2[0]..<rec2[2]
    let yRange2 = rec2[1]..<rec2[3]
    return xRange1.overlaps(xRange2) && yRange1.overlaps(yRange2)
    return false
}
