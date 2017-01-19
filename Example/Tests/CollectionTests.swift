// https://github.com/Quick/Quick

import Quick
import Nimble
import ETUtilities

class Collection: QuickSpec {
    override func spec() {
        
        describe("et_safe subscript") {

            var model:[Int]!
            beforeEach {
                model = [0]
            }

            context("index out of range") {

                it("read") {
                    expect(model[et_safe: 1]).to(beNil())
                }
            }
        }

        describe("et_remove") {

            var measurements:[Double]!
            beforeEach {
                measurements = [1.2, 1.5, 2.9, 1.1, 1.6]
            }

            context("single element") {

                it("middle") {
                    let removed = measurements.et_remove(2.9)
                    expect(removed).to(equal(2.9))
                    expect(measurements.count).to(equal(4))
                    expect(measurements).to(contain([1.2, 1.5, 1.1, 1.6]))
                }

                it("first") {
                    let removed = measurements.et_remove(1.2)
                    expect(removed).to(equal(1.2))
                    expect(measurements.count).to(equal(4))
                    expect(measurements).to(contain([1.5, 2.9, 1.1, 1.6]))
                }

                it("last") {
                    let removed = measurements.et_remove(1.6)
                    expect(removed).to(equal(1.6))
                    expect(measurements.count).to(equal(4))
                    expect(measurements).to(contain([1.2, 1.5, 2.9, 1.1]))
                }

                it("non existing") {
                    let removed = measurements.et_remove(10.0)
                    expect(removed).to(equal(10.0))
                    expect(measurements.count).to(equal(5))
                    expect(measurements).to(contain([1.2, 1.5, 2.9, 1.1, 1.6]))
                }
            }

            context("multiple elements") {

                it("middle") {
                    measurements.et_remove([1.1, 2.9, 1.5])
                    expect(measurements.count).to(equal(2))
                    expect(measurements).to(contain([1.2, 1.6]))
                }

                it("beginning") {
                    measurements.et_remove([1.2, 1.5])
                    expect(measurements.count).to(equal(3))
                    expect(measurements).to(contain([2.9, 1.1, 1.6]))
                }

                it("end") {
                    measurements.et_remove([1.6, 1.1])
                    expect(measurements.count).to(equal(3))
                    expect(measurements).to(contain([1.2, 1.5, 2.9]))
                }

                it("non existing") {
                    measurements.et_remove([10.0, 15.0])
                    expect(measurements.count).to(equal(5))
                    expect(measurements).to(contain([1.2, 1.5, 2.9, 1.1, 1.6]))
                }

                it("all in one") {
                    measurements.et_remove([10.0, 1.2, 2.9, 32.0, 1.6])
                    expect(measurements.count).to(equal(2))
                    expect(measurements).to(contain([1.5, 1.1]))
                }
            }
        }
    }
}
