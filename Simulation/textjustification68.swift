//
//  textjustification68.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/23/25.
/*
 https://leetcode.com/problems/text-justification/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given an array of strings words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.

 You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly maxWidth characters.

 Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line does not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.

 For the last line of text, it should be left-justified, and no extra space is inserted between words.

 Note:

 A word is defined as a character sequence consisting of non-space characters only.
 Each word's length is guaranteed to be greater than 0 and not exceed maxWidth.
 The input array words contains at least one word.
  

 Example 1:

 Input: words = ["This", "is", "an", "example", "of", "text", "justification."], maxWidth = 16
 Output:
 [
    "This    is    an",
    "example  of text",
    "justification.  "
 ]
 Example 2:

 Input: words = ["What","must","be","acknowledgment","shall","be"], maxWidth = 16
 Output:
 [
   "What   must   be",
   "acknowledgment  ",
   "shall be        "
 ]
 Explanation: Note that the last line is "shall be    " instead of "shall     be", because the last line must be left-justified instead of fully-justified.
 Note that the second line is also left-justified because it contains only one word.
 Example 3:

 Input: words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], maxWidth = 20
 Output:
 [
   "Science  is  what we",
   "understand      well",
   "enough to explain to",
   "a  computer.  Art is",
   "everything  else  we",
   "do                  "
 ]
  

 Constraints:

 1 <= words.length <= 300
 1 <= words[i].length <= 20
 words[i] consists of only English letters and symbols.
 1 <= maxWidth <= 100
 words[i].length <= maxWidth

 */
func fullJustify(_ words: [String], _ max: Int) -> [String] {
    var res = [String]()
    var i = 0
    while i < words.count {
        var curLen = words[i].count + 1
        var stack = [words[i]]
        while( i+1 < words.count && max >= (curLen + words[i+1].count) ) {
            i += 1
            stack.append(words[i])
            curLen = curLen + words[i].count + 1
        }
        var temp = ""
        if stack.count == 1 {
            temp = stack.removeFirst()
            temp += String(repeating: " ", count: max-temp.count)
        } else if ( i == words.count-1) {
            temp = stack.joined(separator: " ")
            temp += String(repeating: " ", count: max-curLen+1)
            stack = []
        } else {
            let diff = max - curLen + stack.count
            let space = diff / (stack.count - 1)
            var eSpace = diff % (stack.count - 1)
            while(!stack.isEmpty) {
                temp += stack.removeFirst()
                if !stack.isEmpty {
                    temp += String(repeating: " ", count: eSpace > 0 ? space+1 : space)
                    if eSpace > 0 { eSpace -= 1 }
                }
            }
        }
        res.append(temp)
        i += 1
    }
    return res
}
