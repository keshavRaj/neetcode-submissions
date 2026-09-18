class Solution {
    var adjacencyList: [Int: [Int]] = [:]
    var completed: Set<Int> = []
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        buildAdjacencyList(prerequisites)
        for i in 0..<numCourses {
            var path: Set<Int> = []
            if !completed.contains(i) {
                if !DFS(i, &path) {
                    return false
                }
            }
        }
        return true
    }

    func buildAdjacencyList(_ prerequisites: [[Int]]) {
        for prerequisite in prerequisites {
            adjacencyList[prerequisite[1], default:[]].append(prerequisite[0])
        }
    }

    func DFS(_ course: Int, _ currentPath: inout Set<Int>) -> Bool {
       
        if completed.contains(course) {
            return true
        }
        currentPath.insert(course)
        let prerequisites = adjacencyList[course] ?? []
        for prerequisite in prerequisites {
        if currentPath.contains(prerequisite) {
            return false
        }
         if !DFS(prerequisite, &currentPath) {
            return false
         }
        }
        currentPath.remove(course)
        completed.insert(course)
        return true
    }
}
