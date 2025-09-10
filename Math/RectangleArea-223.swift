//
//  RectangleArea-223.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/2/25.
/*
 https://leetcode.com/problems/rectangle-area/description/?envType=problem-list-v2&envId=math
 
 Given the coordinates of two rectilinear rectangles in a 2D plane, return the total area covered by the two rectangles.

 The first rectangle is defined by its bottom-left corner (ax1, ay1) and its top-right corner (ax2, ay2).

 The second rectangle is defined by its bottom-left corner (bx1, by1) and its top-right corner (bx2, by2).

  

 Example 1:

 Rectangle Area
 Input: ax1 = -3, ay1 = 0, ax2 = 3, ay2 = 4, bx1 = 0, by1 = -1, bx2 = 9, by2 = 2
 Output: 45
 Example 2:

 Input: ax1 = -2, ay1 = -2, ax2 = 2, ay2 = 2, bx1 = -2, by1 = -2, bx2 = 2, by2 = 2
 Output: 16
  

 Constraints:

 -104 <= ax1 <= ax2 <= 104
 -104 <= ay1 <= ay2 <= 104
 -104 <= bx1 <= bx2 <= 104
 -104 <= by1 <= by2 <= 104

 */

func computeArea(_ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
    let ox1 = max(ax1, bx1)
    let ox2 = min(ax2, bx2)
    let oy1 = max(ay1, by1)
    let oy2 = min(ay2, by2)
    
    return area(ax1, ay1, ax2, ay2) + area(bx1, by1, bx2, by2) - area(ox1, oy1, ox2, oy2)
}

private func area(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
    let width = x2 - x1
    let height = y2 - y1
    
    guard width > 0 else { return 0 }
    guard height > 0 else { return 0 }
    return width * height
}
