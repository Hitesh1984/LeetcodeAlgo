//
//  TreeAncestor.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/13/25.
//

import Foundation

/*
 
 https://leetcode.com/problems/kth-ancestor-of-a-tree-node/description/
 
 You are given a tree with n nodes numbered from 0 to n - 1 in the form of a parent array parent where parent[i] is the parent of ith node. The root of the tree is node 0. Find the kth ancestor of a given node.

 The kth ancestor of a tree node is the kth node in the path from that node to the root node.

 Implement the TreeAncestor class:

 TreeAncestor(int n, int[] parent) Initializes the object with the number of nodes in the tree and the parent array.
 int getKthAncestor(int node, int k) return the kth ancestor of the given node node. If there is no such ancestor, return -1.
  

 Example 1:


 Input
 ["TreeAncestor", "getKthAncestor", "getKthAncestor", "getKthAncestor"]
 [[7, [-1, 0, 0, 1, 1, 2, 2]], [3, 1], [5, 2], [6, 3]]
 Output
 [null, 1, 0, -1]

 Explanation
 TreeAncestor treeAncestor = new TreeAncestor(7, [-1, 0, 0, 1, 1, 2, 2]);
 treeAncestor.getKthAncestor(3, 1); // returns 1 which is the parent of 3
 treeAncestor.getKthAncestor(5, 2); // returns 0 which is the grandparent of 5
 treeAncestor.getKthAncestor(6, 3); // returns -1 because there is no such ancestor
  

 Constraints:

 1 <= k <= n <= 5 * 104
 parent.length == n
 parent[0] == -1
 0 <= parent[i] < n for all 0 < i < n
 0 <= node < n
 There will be at most 5 * 104 queries.
 
 */


class TreeAncestor {
    var dp: [[Int]]
    let logN: Int
    
    init(_ n: Int, _ parent: [Int]) {
        logN = Int(log2(Double(n)))+1
        dp = Array(repeating: Array(repeating: -1, count: n), count: logN)
        dp[0] = parent
        for i in 1 ..< logN {
            for j in 0 ..< n {
                dp[i][j] = dp[i-1][j]<0 ? -1 : dp[i-1][dp[i-1][j]]
            }
        }
    }
    
    func getKthAncestor(_ node: Int, _ k: Int) -> Int {
        var node = node
        for i in 0 ..< logN where k >> i & 1 == 1 {
            node = dp[i][node]
            guard node >= 0 else { return -1 }
        }
        return node
    }
}

/*
class TreeAncestor {
    var hashMap = [Int:[Int]]()
    var keys = [Int]()
    var ancestorMapping = [String:Int]()
    init(_ n: Int, _ parent: [Int]) {
            hashMap = parent.enumerated().reduce(into: Dictionary<Int,[Int]>(), { result, pair in
                if((result[pair.element]) != nil) {
                    result[pair.element]?.append(pair.offset)
                } else {
                    result[pair.element] = [pair.offset]
                }
            })
        keys = hashMap.keys.map{ $0 }
    }
    func getKthAncestor(node:Int, k:Int) -> Int {
        var gotParent = -1
        func dfs(val:Int, parent:Int )  {
            let key = getKeyofAncesotr(node: val, parent: parent)
                if let value = ancestorMapping[key] {
                    gotParent = value
                      return
                }
            for key in keys {
                if let values = hashMap[key], values.contains(val) {
                    /*if key == -1 {
                        break
                    }
                    else */if parent > 1 {
                        let key22 = getKeyofAncesotr(node: val, parent: 1)
                        ancestorMapping[key22] = key
                         dfs(val: key, parent: parent-1)
                    } else if parent == 1 {
                        let key22 = getKeyofAncesotr(node: val, parent: parent)
                        ancestorMapping[key22] = key
                        gotParent = key
                        break
                    }
                }
            }
        }
        dfs(val: node, parent: k) // [5,2]
        return gotParent
    }
    
    */
    
