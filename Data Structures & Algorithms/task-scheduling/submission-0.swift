class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        let idleQueue = Queue()
        let executionHeap = MaxHeap() 
        var taskCountArray = Array(repeating: 0 , count: 26)
        let asciiA = Character("A").asciiValue!
        for task in tasks {
            let index = Int(task.asciiValue! - asciiA)
            taskCountArray[index] += 1
        }
        for aTaskCount in taskCountArray {
            if aTaskCount != 0 {
                executionHeap.push(Task(count: aTaskCount, nextAvailableTime: 0))
            }
        }
        var currentTime = 0
        while(!executionHeap.isEmpty() || !idleQueue.isEmpty()) {
            if let idleTask = idleQueue.peek(),
            idleTask.nextAvailableTime <= currentTime {
                executionHeap.push(idleQueue.pop()!)
            }
            if var task = executionHeap.pop() {
                task.count -= 1
                if task.count > 0 {
                    task.nextAvailableTime = currentTime + 1 + n
                    idleQueue.push(task)
                }
            }
            currentTime += 1
        }
        return currentTime
    }
}

struct Task {
        var count: Int
        var nextAvailableTime: Int
    }

class Queue {
    private var elements: [Task] = []
    var front = 0
    
    func push(_ val: Task) {
        elements.append(val)
    }

    func pop() -> Task? {
        guard !isEmpty() else {
            return nil
        }
        let res = elements[front]
        front += 1
        return res
    }

    func peek() -> Task? {
        guard !isEmpty() else {
            return nil
        }
        return elements[front] 
    }

    func isEmpty() -> Bool {
        return front >= elements.count
    }
}

class MaxHeap {
    private var elements:[Task] = [Task(count: 0, nextAvailableTime: 0)]

    func push(_ val: Task) {
        elements.append(val)
        var i = elements.count - 1
        while(i > 1 && elements[i].count > elements[i / 2].count) {
            elements.swapAt(i, i / 2)
            i = i / 2
        }
    }

    func pop() -> Task? {
        if elements.count == 1 {
            return nil
        } else if elements.count == 2 {
            return elements.removeLast()
        }
        let res = elements[1]
        elements[1] = elements.removeLast()
        var i = 1
        while(i * 2 < elements.count) {
            if ((i * 2 + 1) < elements.count) &&
            (elements[i * 2 + 1].count > elements[i * 2].count) &&
            (elements[i * 2 + 1].count > elements[i].count) {
                elements.swapAt(i, i * 2 + 1)
                i = i * 2 + 1
            } else if (elements[i * 2].count > elements[i].count) {
                elements.swapAt(i, i * 2)
                i = i * 2
            } else {
                break
            }
        }
        return res
    }

    func isEmpty() -> Bool {
        return elements.count <= 1
    }
}
