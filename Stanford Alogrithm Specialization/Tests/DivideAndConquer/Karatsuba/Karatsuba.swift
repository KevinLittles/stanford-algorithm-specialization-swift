import Foundation
import BigInt

struct Karatsuba {
    
    static func multiply(_ first: BigInt, _ second: BigInt) -> BigInt {
        if first < 10 || second < 10 {
            return first * second
        }
        
        let maxCount: Int = max(first.description.count, second.description.count)
        
        let (a, b): (BigInt, BigInt) = divide(first, maxCount: maxCount)
        let (c, d): (BigInt, BigInt) = divide(second, maxCount: maxCount)

        let z0: BigInt = multiply(a, c)
        let z1: BigInt = multiply(b, d)
        let z2: BigInt = multiply(a + b, c + d)
        
        return conquer(z0: z0, z1: z1, z2: z2, maxCount: maxCount)
    }
    
    private static func divide(_ value: BigInt, maxCount: Int) -> (BigInt, BigInt) {
        return value.quotientAndRemainder(dividingBy: BigInt(10).power(maxCount/2))
    }
    
    private static func conquer(z0: BigInt, z1: BigInt, z2: BigInt, maxCount: Int) -> BigInt {
        let z3: BigInt = z2 - z1 - z0
        
        return [
            z0 * BigInt(10).power(2 * (maxCount / 2)),
            z3 * BigInt(10).power(maxCount / 2),
            z1
        ].reduce(0, { $0 + $1 })
    }
    
}
