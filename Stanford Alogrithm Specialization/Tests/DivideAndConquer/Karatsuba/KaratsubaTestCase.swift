//
//  KaratsubaTestCase.swift
//  Tests
//
//  Created by Kevin Littles on 13/01/24.
//

import XCTest
import BigInt

final class KaratsubaTestCase: XCTestCase {

    func test0() {
        XCTAssertEqual(
            Karatsuba.multiply(
                "3141592653589793238462643383279502884197169399375105820974944592",
                "2718281828459045235360287471352662497757247093699959574966967627"
            ),
            "8539734222673567065463550869546574495034888535765114961879601127067743044893204848617875072216249073013374895871952806582723184"
        )
    }

    func test1() {
        XCTAssertEqual(
            Karatsuba.multiply("12345", "6789"),
            "83810205"
        )
    }

    func test2() {
        XCTAssertEqual(
            Karatsuba.multiply("0", "1234567890"),
            "0"
        )
    }

    func test3() {
        XCTAssertEqual(
            Karatsuba.multiply("111", "111"),
            "12321"
        )
    }

    func test4() {
        XCTAssertEqual(
            Karatsuba.multiply("99999", "1"),
            "99999"
        )
    }

    func test5() {
        XCTAssertEqual(
            Karatsuba.multiply("123456789012345678901234567890", "987654321098765432109876543210"),
            "121932631137021795226185032733622923332237463801111263526900"
        )
    }

    func test6() {
        XCTAssertEqual(
            Karatsuba.multiply("123", "0"),
            "0"
        )
    }
    
    func test7() {
        XCTAssertEqual(
            Karatsuba.multiply("100000000", "100000000"),
            "10000000000000000"
        )
    }

    func test8() {
        XCTAssertEqual(
            Karatsuba.multiply("999999999", "999999999"),
            "999999998000000001"
        )
    }

    func test9() {
        XCTAssertEqual(
            Karatsuba.multiply("123456789", "987654321"),
            "121932631112635269"
        )
    }

    func test10() {
        XCTAssertEqual(
            Karatsuba.multiply("54321", "12345"),
            "670592745"
        )
    }

    func test11() {
        XCTAssertEqual(
            Karatsuba.multiply("1", "123456789012345678901234567890"),
            "123456789012345678901234567890"
        )
    }

    func test12() {
        XCTAssertEqual(
            Karatsuba.multiply("987654321", "0"),
            "0"
        )
    }

    func test13() {
        XCTAssertEqual(
            Karatsuba.multiply("111111111", "111111111"),
            "12345678987654321"
        )
    }

    func test14() {
        XCTAssertEqual(
            Karatsuba.multiply("222222222", "333333333"),
            "74074073925925926"
        )
    }
    
    func test15() {
        XCTAssertEqual(
            Karatsuba.multiply("2", "5"),
            "10"
        )
    }

    func test16() {
        XCTAssertEqual(
            Karatsuba.multiply("9", "9"),
            "81"
        )
    }

    func test17() {
        XCTAssertEqual(
            Karatsuba.multiply("10", "10"),
            "100"
        )
    }

    func test18() {
        XCTAssertEqual(
            Karatsuba.multiply("12", "12"),
            "144"
        )
    }

    func test19() {
        XCTAssertEqual(
            Karatsuba.multiply("15", "4"),
            "60"
        )
    }

    func test20() {
        XCTAssertEqual(
            Karatsuba.multiply("25", "4"),
            "100"
        )
    }

    func test21() {
        XCTAssertEqual(
            Karatsuba.multiply("11", "11"),
            "121"
        )
    }

    func test22() {
        XCTAssertEqual(
            Karatsuba.multiply("123", "1"),
            "123"
        )
    }

    func test23() {
        XCTAssertEqual(
            Karatsuba.multiply("50", "2"),
            "100"
        )
    }

}
