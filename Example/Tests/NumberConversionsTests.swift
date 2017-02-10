// https://github.com/Quick/Quick

import Quick
import Nimble
import ETUtilities
import DeviceKit

class NumberConversionsTests: QuickSpec {

    override func spec() {

        describe("CGFloat") {

            it("from Int") {

                let i: Int = 1

                let e1 = (type(of: i) == CGFloat.self)
                expect(e1).to(equal(false))

                let e2 = (type(of: i.cgFloat) == CGFloat.self)
                expect(e2).to(equal(true))
            }

            it("from Float") {

                let i: Float = 1.0

                let e1 = (type(of: i) == CGFloat.self)
                expect(e1).to(equal(false))

                let e2 = (type(of: i.cgFloat) == CGFloat.self)
                expect(e2).to(equal(true))
            }

            it("from Double") {

                let i: Double = 1.0

                let e1 = (type(of: i) == CGFloat.self)
                expect(e1).to(equal(false))

                let e2 = (type(of: i.cgFloat) == CGFloat.self)
                expect(e2).to(equal(true))
            }
        }

        describe("Double") {

            it("from Int") {

                let i: Int = 1

                let e1 = (type(of: i) == Double.self)
                expect(e1).to(equal(false))

                let e2 = (type(of: i.double) == Double.self)
                expect(e2).to(equal(true))
            }

            it("from CGFloat") {

                let i: CGFloat = 1.0

                let e1 = (type(of: i) == Double.self)
                expect(e1).to(equal(false))

                let e2 = (type(of: i.double) == Double.self)
                expect(e2).to(equal(true))
            }
        }

        describe("Int") {

            it("from CGFloat") {

                let i: CGFloat = 1.0

                let e1 = (type(of: i) == Int.self)
                expect(e1).to(equal(false))

                let e2 = (type(of: i.int) == Int.self)
                expect(e2).to(equal(true))
            }

            it("from Double") {

                let i: Double = 1.0

                let e1 = (type(of: i) == Int.self)
                expect(e1).to(equal(false))
                
                let e2 = (type(of: i.int) == Int.self)
                expect(e2).to(equal(true))
            }
        }
    }
}
