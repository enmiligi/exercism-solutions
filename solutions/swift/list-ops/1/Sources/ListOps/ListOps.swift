func append<A>(_ list1: [A], _ list2: [A]) -> [A] {
    var result: [A] = list1
    for elem in list2 {
        result.append(elem)
    }
    return result
}

func concat<A>(_ lists: [A]...) -> [A] {
    var result: [A] = []
    for list in lists {
        for elem in list {
            result.append(elem)
        }
    }
    return result
}

func filter<A>(_ list: [A], _ condition: (A) -> Bool) -> [A] {
    var result: [A] = []
    for elem in list {
        if condition(elem) {
            result.append(elem)
        }
    }
    return result
}

func length<A>(_ list: [A]) -> Int {
    var len = 0
    for _ in list {
        len += 1
    }
    return len
}

func map<A, B>(_ list: [A], _ function: (A) -> B) -> [B] {
    var result: [B] = []
    for elem in list {
        result.append(function(elem))
    }
    return result
}

func foldLeft<A, B>(_ list: [A], accumulated start: B, combine function: (B, A) -> B) -> B {
    var result = start
    for elem in list {
        result = function(result, elem)
    }
    return result
}

func foldRight<A, B>(_ list: [A], accumulated start: B, combine function: (A, B) -> B) -> B {
    var result = start
    var index = length(list)
    while index > 0 {
        index -= 1
        result = function(list[index], result)
    }
    return result
}

func reverse<A>(_ list: [A]) -> [A] {
    var result: [A] = []
    var index = length(list)
    while index > 0 {
        index -= 1
        result.append(list[index])
    }
    return result
}