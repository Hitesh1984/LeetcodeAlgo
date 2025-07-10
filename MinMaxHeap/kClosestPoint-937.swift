//
//  kClosestPoint.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 2/27/25.
//
/*
 https://leetcode.com/problems/k-closest-points-to-origin/description/
 
 Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane and an integer k, return the k closest points to the origin (0, 0).

 The distance between two points on the X-Y plane is the Euclidean distance (i.e., √(x1 - x2)2 + (y1 - y2)2).

 You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in).

  

 Example 1:


 Input: points = [[1,3],[-2,2]], k = 1
 Output: [[-2,2]]
 Explanation:
 The distance between (1, 3) and the origin is sqrt(10).
 The distance between (-2, 2) and the origin is sqrt(8).
 Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
 We only want the closest k = 1 points from the origin, so the answer is just [[-2,2]].
 Example 2:

 Input: points = [[3,3],[5,-1],[-2,4]], k = 2
 Output: [[3,3],[-2,4]]
 Explanation: The answer [[-2,4],[3,3]] would also be accepted.
  

 Constraints:

 1 <= k <= points.length <= 104
 -104 <= xi, yi <= 104
 */
import Foundation
import Collections

struct pointIndex:Comparable  {
    let area:Int
    let index:Int
    static func < (lhs:pointIndex, rhs:pointIndex) -> Bool {
        lhs.area < rhs.area
    }
}

func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
    if points.count == 0 || K == 0 || K > points.count {
        return [[]]
    }
    var minHeap = Heap<pointIndex>()
    for i in 0..<points.count{
        let pt = points[i]
        let area = (abs(pt[0])*abs(pt[0])) + (abs(pt[1])*abs(pt[1]))
        minHeap.insert(pointIndex(area: area, index: i))
    }
    var res:[[Int]] = []
    var K = K
    while K > 0 {
        let item = minHeap.popMin()!
        minHeap.min
        res.append(points[item.index])
        K -= 1
    }
    return res
}



/*
func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    var task: MinHeap? = MinHeap<Int>()
    var ans = [[Int]]()
    for point in points {
        let distance = distance(xPoint: point[0],
                                yPoint: point[1])
        task?.items.append((value: distance,
                            point: point))
    }
    task?.minHeapify()
    for _ in Range(0...k-1)
    {
        if let result = task?.pop() {
            ans.append(result.point)
        }
    }
    return ans
}
func distance(xPoint:Int, yPoint:Int ) -> Int {
    return Int(pow(Double(xPoint - 0),2) +
               pow(Double(yPoint - 0),2))
}
*/
