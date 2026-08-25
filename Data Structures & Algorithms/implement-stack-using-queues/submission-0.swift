class MyStack {
    let mainQueue = Queue()
    let auxilaryQueue = Queue()

    init() {

    }

    func push(_ x: Int) {
        mainQueue.enqueue(x)
    }

    func pop() -> Int {
        var prev: Int? = nil
        while let value = mainQueue.dequeue(){
            if let prevVal = prev {
                auxilaryQueue.enqueue(prevVal)
            }
            prev = value
        }
        while let value = auxilaryQueue.dequeue() {
            mainQueue.enqueue(value)
        }
        return prev!
    }

    func top() -> Int {
        var prev: Int? = nil
        while let value = mainQueue.dequeue(){
            if let prevVal = prev {
                auxilaryQueue.enqueue(prevVal)
            }
            prev = value
        }
        while let value = auxilaryQueue.dequeue() {
            mainQueue.enqueue(value)
        }
        mainQueue.enqueue(prev!)
        return prev!
    }

    func empty() -> Bool {
        mainQueue.isEmpty() 
    }
}

class Queue {
    var head: Node?
    var tail: Node?

    func enqueue(_ val: Int) {
        let node = Node(val)
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }

    func dequeue() -> Int? {
        let next = head?.next
        let value = head?.value
        head?.next = nil
        head = next
        if head == nil {
            tail = nil
        }
        return value
    }

    func isEmpty() -> Bool {
        return head == nil
    }

}

class Node {
    let value: Int
    var next: Node?

    init(_ val: Int) {
        self.value = val
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let param_2 = obj.pop()
 * let param_3 = obj.top()
 * let param_4 = obj.empty()
 */
