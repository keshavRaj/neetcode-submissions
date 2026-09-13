class Twitter {
    var timeStamp = 0
    var tweets: [Int: [Tweet]] = [:]
    var following: [Int: Set<Int>] = [:]

    func postTweet(_ userId: Int, _ tweetId: Int) {
        let tweet = Tweet(id: tweetId, timeStamp: timeStamp, userId: userId)
        if var userTweets = tweets[userId] {
            userTweets.append(tweet)
            if userTweets.count > 10 {
                userTweets.removeFirst()
            }
            tweets[userId] = userTweets
        } else {
            tweets[userId] = [tweet]
        }
        timeStamp += 1
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        let tweetHeap = Heap()
        let followerIds = following[userId, default: []]
        var currentIndexes: [Int: Int] = [:]
        for id in followerIds {
            if let userTweets = tweets[id],
            userTweets.count > 0 {
                currentIndexes[id] = userTweets.count - 1
            }
        }
        if let userTweets = tweets[userId],
            userTweets.count > 0 {
                currentIndexes[userId] = userTweets.count - 1
            }
        for (key, value) in currentIndexes {
            tweetHeap.push(tweets[key]![value])
        }
        var news: [Int] = []
        var i = 1
        while(i <= 10) {
            guard let tweet = tweetHeap.pop() else {
                break
            }
            news.append(tweet.id)
            var index = currentIndexes[tweet.userId]!
            index -= 1
            guard index >= 0 else {
                i += 1
                continue
            }
            tweetHeap.push(tweets[tweet.userId]![index])
            currentIndexes[tweet.userId] = index
            i += 1
        }
        return news
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        following[followerId, default: []].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        if var followeeIds = following[followerId] {
            followeeIds.remove(followeeId)
            following[followerId] = followeeIds
        }
    }

}

struct Tweet {
    let id: Int
    let timeStamp: Int
    let userId: Int
}

class Heap {
    private var elements: [Tweet] = [Tweet(id: -1, timeStamp: -1, userId: -1)]

    func push(_ tweet: Tweet) {
        elements.append(tweet)
        var i = elements.count - 1
        while(i > 1 && elements[i].timeStamp > elements[i / 2].timeStamp) {
            elements.swapAt(i, i/2)
            i = i / 2
        }
    }

    func pop() -> Tweet? {
        if elements.count == 1 {
            return nil
        } else if elements.count == 2 {
            return elements.removeLast()
        }
        let res = elements[1]
        elements[1] = elements.removeLast()
        var i = 1
        while(i * 2 < elements.count) {
            if (i * 2 + 1) < elements.count &&
            elements[i * 2 + 1].timeStamp > elements[i * 2].timeStamp &&
            elements[i].timeStamp < elements[i * 2 + 1].timeStamp {
                elements.swapAt(i, i * 2 + 1)
                i = i * 2 + 1
            } else if elements[i].timeStamp < elements[i * 2].timeStamp {
                elements.swapAt(i, i * 2)
                i = i * 2
            } else {
                break
            }
        }
        return res
    }

}
