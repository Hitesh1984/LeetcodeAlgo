//
//  canSchedule-2-210.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/10/25.
//
/*
 https://leetcode.com/problems/course-schedule-ii/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

 For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
 Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.

  

 Example 1:

 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: [0,1]
 Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0. So the correct course order is [0,1].
 Example 2:

 Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
 Output: [0,2,1,3]
 Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
 So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3].
 Example 3:

 Input: numCourses = 1, prerequisites = []
 Output: [0]
  

 Constraints:

 1 <= numCourses <= 2000
 0 <= prerequisites.length <= numCourses * (numCourses - 1)
 prerequisites[i].length == 2
 0 <= ai, bi < numCourses
 ai != bi
 All the pairs [ai, bi] are distinct.

 */
import Foundation


func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var preCourses = [Int:[Int]]()
    for relation in prerequisites {
        preCourses[relation[0], default: []].append(relation[1])
    }
    var isVisit = Set<Int>()
    var cycle = Set<Int>()
    var output = [Int]()
    func dfs( _ course: Int) -> Bool {
        if cycle.contains(course) {
            return false
        }
        if isVisit.contains(course) {
            return true
        }
        cycle.insert(course)
        if let course = preCourses[course], course.isEmpty {
            return true
        }
        for preCourse in preCourses[course] ?? [] {
            guard dfs(preCourse) else { return false }
        }
        cycle.remove(course)
        isVisit.insert(course)
        preCourses[course] = []
        output.append(course)
        return true
    }
    for course in 0..<numCourses {
        guard dfs(course) else { return [] }
    }
    return output
}
