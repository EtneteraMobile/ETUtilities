// https://github.com/Quick/Quick

import Quick
import Nimble
import ETUtilities
import DeviceKit

class FloatingPointTests: QuickSpec {

    override func spec() {


        describe("round toNearest") {

            it("CGFloat") {
                expect(round(CGFloat(10.4), toNearest: 0.5)).to(equal(10.5))
                expect(round(CGFloat(10.24), toNearest: 0.5)).to(equal(10.0))
                expect(round(CGFloat(10.26), toNearest: 0.5)).to(equal(10.5))
                expect(round(CGFloat(14.2), toNearest: 10.0)).to(equal(10.0))
                expect(round(CGFloat(15.05), toNearest: 10.0)).to(equal(20.0))
            }

            it("Float") {
                expect(round(Float(10.4), toNearest: 0.5)).to(equal(10.5))
                expect(round(Float(10.24), toNearest: 0.5)).to(equal(10.0))
                expect(round(Float(10.26), toNearest: 0.5)).to(equal(10.5))
                expect(round(Float(14.2), toNearest: 10.0)).to(equal(10.0))
                expect(round(Float(15.05), toNearest: 10.0)).to(equal(20.0))
            }

            it("Double") {
                expect(round(Double(10.4), toNearest: 0.5)).to(equal(10.5))
                expect(round(Double(10.24), toNearest: 0.5)).to(equal(10.0))
                expect(round(Double(10.26), toNearest: 0.5)).to(equal(10.5))
                expect(round(Double(14.2), toNearest: 10.0)).to(equal(10.0))
                expect(round(Double(15.05), toNearest: 10.0)).to(equal(20.0))
            }
        }
        describe("floor toNearest") {

            it("CGFloat") {
                expect(floor(CGFloat(10.4), toNearest: 0.5)).to(equal(10.0))
                expect(floor(CGFloat(10.24), toNearest: 0.5)).to(equal(10.0))
                expect(floor(CGFloat(10.26), toNearest: 0.5)).to(equal(10.0))
                expect(floor(CGFloat(14.2), toNearest: 10.0)).to(equal(10.0))
                expect(floor(CGFloat(15.05), toNearest: 10.0)).to(equal(10.0))
            }

            it("Float") {
                expect(floor(Float(10.4), toNearest: 0.5)).to(equal(10.0))
                expect(floor(Float(10.24), toNearest: 0.5)).to(equal(10.0))
                expect(floor(Float(10.26), toNearest: 0.5)).to(equal(10.0))
                expect(floor(Float(14.2), toNearest: 10.0)).to(equal(10.0))
                expect(floor(Float(15.05), toNearest: 10.0)).to(equal(10.0))
            }

            it("Double") {
                expect(floor(Double(10.4), toNearest: 0.5)).to(equal(10.0))
                expect(floor(Double(10.24), toNearest: 0.5)).to(equal(10.0))
                expect(floor(Double(10.26), toNearest: 0.5)).to(equal(10.0))
                expect(floor(Double(14.2), toNearest: 10.0)).to(equal(10.0))
                expect(floor(Double(15.05), toNearest: 10.0)).to(equal(10.0))
            }
        }
        describe("ceil toNearest") {

            it("CGFloat") {
                expect(ceil(CGFloat(10.4), toNearest: 0.5)).to(equal(10.5))
                expect(ceil(CGFloat(10.24), toNearest: 0.5)).to(equal(10.5))
                expect(ceil(CGFloat(10.26), toNearest: 0.5)).to(equal(10.5))
                expect(ceil(CGFloat(14.2), toNearest: 10.0)).to(equal(20.0))
                expect(ceil(CGFloat(15.05), toNearest: 10.0)).to(equal(20.0))
            }

            it("Float") {
                expect(ceil(Float(10.4), toNearest: 0.5)).to(equal(10.5))
                expect(ceil(Float(10.24), toNearest: 0.5)).to(equal(10.5))
                expect(ceil(Float(10.26), toNearest: 0.5)).to(equal(10.5))
                expect(ceil(Float(14.2), toNearest: 10.0)).to(equal(20.0))
                expect(ceil(Float(15.05), toNearest: 10.0)).to(equal(20.0))
            }

            it("Double") {
                expect(ceil(Double(10.4), toNearest: 0.5)).to(equal(10.5))
                expect(ceil(Double(10.24), toNearest: 0.5)).to(equal(10.5))
                expect(ceil(Double(10.26), toNearest: 0.5)).to(equal(10.5))
                expect(ceil(Double(14.2), toNearest: 10.0)).to(equal(20.0))
                expect(ceil(Double(15.05), toNearest: 10.0)).to(equal(20.0))
            }
        }
    }
}
