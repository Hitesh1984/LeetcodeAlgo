//
//  courseSchedule-1-207.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/2/25.
//
/*
 https://leetcode.com/problems/course-schedule/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
 
 For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
 Return true if you can finish all courses. Otherwise, return false.
 
 
 
 Example 1:
 
 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: true
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0. So it is possible.
 Example 2:
 
 Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
 
 
 Constraints:
 
 1 <= numCourses <= 2000
 0 <= prerequisites.length <= 5000
 prerequisites[i].length == 2
 0 <= ai, bi < numCourses
 All the pairs prerequisites[i] are unique.
 
 
 */

import Foundation

// Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
// Output: false

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    
    var preCourses = [Int:[Int]]()
    for relation in prerequisites {
        preCourses[relation[0], default: []].append(relation[1])
    }
    var isVisited = [Int:Bool]()
    
    func dfs( _ course: Int) -> Bool {
        if let fullyVisited = isVisited[course] { return fullyVisited }
        if let course = preCourses[course], course.isEmpty {
            return true
        }
        isVisited[course] = false
        for preCourse in preCourses[course] ?? [] {
            guard dfs(preCourse) else { return false }
        }
        isVisited[course] = true
        preCourses[course] = []
        return true
    }
    for course in preCourses.keys {
        guard dfs(course) else { return false }
    }
    return true
}



/*
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    // use a dictionary to bond course with its pre request course
    
    var preCourses = [Int:[Int]]()
    for relation in prerequisites {
        preCourses[relation[0], default: []].append(relation[1])
    }
    

    
    
    // bond each course with its visited info, and check if has circle
    var isVisited = [Int:Bool]()
    
    // main idea is: go through each courses iteratively, and find if there is any circle case, if so, return false.
    for course in preCourses.keys {
        guard dfs(preCourses, course, &isVisited) else { return false }
    }
    return true
}

func dfs(_ preCourses: [Int:[Int]], _ course: Int, _ isVisited: inout [Int:Bool]) -> Bool {
    // check if we have visited this course before; 1. when not fully visited, which means has circle, return false; 2. when fully visited, return true
    if let fullyVisited = isVisited[course] { return fullyVisited }
    
    // mark as start visit this course, but not finished yet
    isVisited[course] = false
    
    for preCourse in preCourses[course] ?? [] {
        // go through each cases, and see if there occur circles
        guard dfs(preCourses, preCourse, &isVisited) else { return false }
    }
    
    // mark as finshed visiting this course, and fully check, no circles
    isVisited[course] = true
    
    return true
}
*/
