// https://github.com/Quick/Quick

import Quick
import Nimble
import ETUtilities

@available(iOS 9.0, *)
class Application: QuickSpec {

    override func spec() {

        describe("version description") {

            beforeEach {
                XCUIApplication().launch()
            }

            it("name") {
                let name = UIApplication.et_versionName
                expect(name).to(equal("1.0"))
            }

            it("build") {
                let build = UIApplication.et_versionBuild
                expect(build).to(equal("1"))
            }
            
            it("complete") {
                let complete = UIApplication.et_versionComplete
                expect(complete).to(equal("1.0 (1)"))
            }
        }
    }
}
