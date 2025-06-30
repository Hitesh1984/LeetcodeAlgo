//
//  TreeNode.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/4/25.
//

import Foundation

public class TreeNode {
    
    public var val:Int
    public var left:TreeNode?
    public var right:TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(value:Int) {
        self.val = value
        self.left = nil
        self.right = nil
    }
    
    public init(left: TreeNode?, value:Int, right:TreeNode?) {
        self.val = value
        self.left = left
        self.right = right
    }
}

extension TreeNode: CustomStringConvertible {
    public var description:String {
        
        if (left != nil) && (right != nil) {
            return "value \(val), left = [" + (left?.description ?? "") + "], right = [" + (right?.description ??  "") + "]"
        } else if left != nil {
            return "value \(val), left = [" + (left?.description ?? "") + "]"
        } else if right != nil {
            return "value \(val),  right = [" + (right?.description ??  "") + "]"
        } else {
            return ""
        }
    }
}
