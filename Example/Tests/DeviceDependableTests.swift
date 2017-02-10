// https://github.com/Quick/Quick

import Quick
import Nimble
import ETUtilities
import DeviceKit

class DeviceDependableTests: QuickSpec {

    override func spec() {

        describe("et_replace on") {

            it("Int") {

                let result = 1
                    .et_replace(with: 11, on: .iPhone5)
                    .et_replace(with: 13, on: .iPhone6Plus)
                    .et_replace(with: 14, on: .iPadAir)
                    .et_replace(with: 20, on: .iPadPro12Inch)

                let expected: Int
                switch UIDevice.et_this {
                case .iPhone5: expected = 11
                case .iPhone6Plus: expected = 13
                case .iPadAir: expected = 14
                case .iPadPro12Inch: expected = 20
                default: expected = 1
                }

                expect(result).to(equal(expected))
            }

            it("String") {

                let result = "a"
                    .et_replace(with: "b", on: .iPhone5)
                    .et_replace(with: "c", on: .iPhone6Plus)
                    .et_replace(with: "d", on: .iPadAir)
                    .et_replace(with: "e", on: .iPadPro12Inch)

                let expected: String
                switch UIDevice.et_this {
                case .iPhone5: expected = "b"
                case .iPhone6Plus: expected = "c"
                case .iPadAir: expected = "d"
                case .iPadPro12Inch: expected = "e"
                default: expected = "a"
                }

                expect(result).to(equal(expected))
            }

            it("custom struct") {

                let a = TestStruct(text: "a")
                let b = TestStruct(text: "b")
                let c = TestStruct(text: "c")
                let d = TestStruct(text: "d")
                let e = TestStruct(text: "e")

                let result = a
                    .et_replace(with: b, on: .iPhone5)
                    .et_replace(with: c, on: .iPhone6Plus)
                    .et_replace(with: d, on: .iPadAir)
                    .et_replace(with: e, on: .iPadPro12Inch)

                let expected: TestStruct
                switch UIDevice.et_this {
                case .iPhone5: expected = b
                case .iPhone6Plus: expected = c
                case .iPadAir: expected = d
                case .iPadPro12Inch: expected = e
                default: expected = a
                }

                expect(result.text).to(equal(expected.text))
            }
        }

        describe("et_replace onDiagonalOf") {


            beforeEach {


            }

            it("Int") {

                let result = 1
                    .et_replace(with: 11, onDiagonalOf: .iPhone5)
                    .et_replace(with: 13, onDiagonalOf: .iPhone6Plus)
                    .et_replace(with: 14, onDiagonalOf: .iPadAir)
                    .et_replace(with: 20, onDiagonalOf: .iPadPro12Inch)

                let expected: Int
                switch UIDevice.et_this.diagonal {
                case Device.iPhone5.diagonal: expected = 11
                case Device.iPhone6Plus.diagonal: expected = 13
                case Device.iPadAir.diagonal: expected = 14
                case Device.iPadPro12Inch.diagonal: expected = 20
                default: expected = 1
                }

                expect(result).to(equal(expected))
            }

            it("String") {

                let result = "a"
                    .et_replace(with: "b", onDiagonalOf: .iPhone5)
                    .et_replace(with: "c", onDiagonalOf: .iPhone6Plus)
                    .et_replace(with: "d", onDiagonalOf: .iPadAir)
                    .et_replace(with: "e", onDiagonalOf: .iPadPro12Inch)

                let expected: String
                switch UIDevice.et_this.diagonal {
                case Device.iPhone5.diagonal: expected = "b"
                case Device.iPhone6Plus.diagonal: expected = "c"
                case Device.iPadAir.diagonal: expected = "d"
                case Device.iPadPro12Inch.diagonal: expected = "e"
                default: expected = "a"
                }

                expect(result).to(equal(expected))
            }

            it("custom struct") {

                let a = TestStruct(text: "a")
                let b = TestStruct(text: "b")
                let c = TestStruct(text: "c")
                let d = TestStruct(text: "d")
                let e = TestStruct(text: "e")

                let result = a
                    .et_replace(with: b, onDiagonalOf: .iPhone5)
                    .et_replace(with: c, onDiagonalOf: .iPhone6Plus)
                    .et_replace(with: d, onDiagonalOf: .iPadAir)
                    .et_replace(with: e, onDiagonalOf: .iPadPro12Inch)

                let expected: TestStruct
                switch UIDevice.et_this.diagonal {
                case Device.iPhone5.diagonal: expected = b
                case Device.iPhone6Plus.diagonal: expected = c
                case Device.iPadAir.diagonal: expected = d
                case Device.iPadPro12Inch.diagonal: expected = e
                default: expected = a
                }
                
                expect(result.text).to(equal(expected.text))
            }
        }
    }

    // MARK: - Inner

    struct TestStruct: DeviceDependable {
        let text: String
    }
}
