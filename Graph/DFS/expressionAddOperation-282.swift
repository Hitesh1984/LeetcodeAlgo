//
//  expressionAddOperation-282.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/21/25.
/*
 https://leetcode.com/problems/expression-add-operators/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a string num that contains only digits and an integer target, return all possibilities to insert the binary operators '+', '-', and/or '*' between the digits of num so that the resultant expression evaluates to the target value.

 Note that operands in the returned expressions should not contain leading zeros.

  

 Example 1:

 Input: num = "123", target = 6
 Output: ["1*2*3","1+2+3"]
 Explanation: Both "1*2*3" and "1+2+3" evaluate to 6.
 Example 2:

 Input: num = "232", target = 8
 Output: ["2*3+2","2+3*2"]
 Explanation: Both "2*3+2" and "2+3*2" evaluate to 8.
 Example 3:

 Input: num = "3456237490", target = 9191
 Output: []
 Explanation: There are no expressions that can be created from "3456237490" to evaluate to 9191.
  

 Constraints:

 1 <= num.length <= 10
 num consists of only digits.
 -231 <= target <= 231 - 1
 */




func addOperators(_ num: String, _ target: Int) -> [String] {
    var allExpression = [String]()
    
    func dfs(_ num: [Character],
                   _ start: Int,
                   _ expression: String,
                   _ value: Int,
                   _ prev: Int,
                   _ target: Int) {
        
        if start == num.count {
            if value == target {
                allExpression.append(expression)
            }
        } else {
            var currNum = 0
            for index in start..<num.count {
                if index != start && num[start] == "0" { break }
                currNum = currNum * 10 + Int(String(num[index]))!
                
                if start == 0  {
                    dfs(num, index + 1, expression + "\(currNum)", currNum, currNum, target)
                } else {
                    dfs(num, index + 1, expression + "+\(currNum)", value  + currNum, currNum, target)
                  
                    dfs(num, index + 1, expression + "-\(currNum)", value - currNum, -currNum, target)
                   
                    let mulValue = value - prev + ( prev * currNum)
                    dfs(num, index + 1, expression + "*\(currNum)", mulValue, prev * currNum, target)
                }
            }
        }
    }

    dfs(Array(num), 0, "", 0, 0, target)
    return allExpression
}
   
