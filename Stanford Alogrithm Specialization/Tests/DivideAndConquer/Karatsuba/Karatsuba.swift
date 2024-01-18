import Foundation
import BigInt

struct Karatsuba {
    
    static func multiply(_ first: BigInt, _ second: BigInt) -> BigInt {
        if first < 10 || second < 10 {
            return first * second
        }
        
        let maxCount = max(first.description.count, second.description.count)
        
        let (a, b): (BigInt, BigInt) = first.quotientAndRemainder(dividingBy: BigInt(10).power(maxCount/2))
        let (c, d): (BigInt, BigInt) = second.quotientAndRemainder(dividingBy: BigInt(10).power(maxCount/2))

        let z0: BigInt = multiply(a, c)
        let z1: BigInt = multiply(b, d)
        let z2: BigInt = multiply(a + b, c + d)
        let z3: BigInt = z2 - z1 - z0
        
        return [
            z0 * BigInt(10).power(2 * (maxCount / 2)),
            z3 * BigInt(10).power(maxCount / 2),
            z1
        ].reduce(0, { $0 + $1 })
    }
    
}
