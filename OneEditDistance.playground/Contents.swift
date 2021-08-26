func isOneEditDistance(_ s: String, _ t: String) -> Bool {
    if s.count - t.count > 1 || s.count - t.count < -1 {
        return false
    }
    if s.count == 0 && t.count == 0 {
        return false
    }
    if s.count == 0 || t.count == 0 {
        return true
    }
    let sA: [Character] = Array(s)
    let tA: [Character] = Array(t)
    var sp = 0
    var tp = 0
    var mismatch = 0
    while sp < s.count && tp < t.count {
        while sA[sp] == tA[tp] {
            sp += 1
            tp += 1
            if sp >= s.count || tp >= t.count {
                break
            }
        }
        if sp + 1 < s.count && sA[sp + 1] == tA[tp] {
            sp += 1
            mismatch += 1
        } else if tp + 1 < t.count && tA[tp + 1] == sA[sp] {
            tp += 1
            mismatch += 1
        }
        if mismatch > 1 {
            return false
        }
        sp += 1
        tp += 1
    }
    if sp == s.count && mismatch == 1 {
        return tp == t.count
    }
    if tp == t.count && mismatch == 1 {
        return sp == s.count
    }
    return false
}


let s = "ab", t = "acb"
isOneEditDistance(s, t)

let s1 = "", t1 = ""
isOneEditDistance(s1, t1)

let s2 = "a", t2 = ""
isOneEditDistance(s2, t2)

let s3 = "abcc", t3 = "abbcc"
isOneEditDistance(s3, t3)
