// https://github.com/Quick/Quick

import Quick
import Nimble
import ETUtilities

class Collection: QuickSpec {
    override func spec() {
        
        describe("index out of range") {

            var model:[Int]!
            beforeEach {
                model = [0]
            }

            context("use safe subscript") {

                it("read") {
                    expect(model[et_safe: 1]).to(beNil())
                }
            }
        }
    }
}
