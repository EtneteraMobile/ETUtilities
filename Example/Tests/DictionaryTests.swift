// https://github.com/Quick/Quick

import Quick
import Nimble
import ETUtilities

class Dictionary: QuickSpec {

    enum TransformError: Error {
        case Error
    }
    override func spec() {

        // MARK: - Map pairs

        describe("map Int pairs") {

            var model:[Int:Int]!
            beforeEach {
                model = [0:0, 1:1, 2:2]
            }

            it("to String") {

                let mapped:[String: String] = model.et_mapPairs {
                    (String($0), String($1))
                }
                expect(mapped.count).to(equal(3))
                expect(mapped["0"]).to(equal("0"))
                expect(mapped["1"]).to(equal("1"))
                expect(mapped["2"]).to(equal("2"))
            }

            it("and throws") {

                do {
                    expect(try model.et_mapPairs { _, _ -> (String, String) in
                    throw TransformError.Error
                    }).to(throwError())
                }
                catch {}
            }
        }

        // MARK: - Key path

        describe("key path access") {

            var dict: [String: Any]!
            beforeEach {
                let characters: [String: Any] = [
                    "Scrooge McDuck": "Dagobert",
                    "Huey": "Tick",
                    "Dewey": "Trick",
                    "Louie": "Track",
                    "Gyro Gearloose": "Daniel Düsentrieb",
                    "int": 123
                ]
                let places: [Any] = [ "Duckburg", "Money Bin" ]
                let translations: [String: Any] = [
                    "characters": characters,
                    "region": "Czech republic",
                    "places": places
                ]
                dict = [
                    "language": "de",
                    "int": 123,
                    "translations": translations
                ]
            }

            context("read") {
                it("as String") {
                    expect(dict[et_keyPath: "language"] as? String).to(equal("de"))
                    expect(dict[et_keyPath: "translations.region"] as? String).to(equal("Czech republic"))
                    expect(dict[et_keyPath: "translations.characters.Gyro Gearloose"] as? String).to(equal("Daniel Düsentrieb"))

                    expect(dict[et_keyPath: "int"] as? String).to(beNil())
                    expect(dict[et_keyPath: "translations.characters.int"] as? String).to(beNil())

                    expect(dict[et_keyPath: "translations.characters"] as? String).to(beNil())

                    expect(dict[et_keyPath: "translations.places"] as? String).to(beNil())
                }
                it("as Int") {
                    expect(dict[et_keyPath: "language"] as? Int).to(beNil())
                    expect(dict[et_keyPath: "translations.region"] as? Int).to(beNil())
                    expect(dict[et_keyPath: "translations.characters.Gyro Gearloose"] as? Int).to(beNil())

                    expect(dict[et_keyPath: "int"] as? Int).to(equal(123))
                    expect(dict[et_keyPath: "translations.characters.int"] as? Int).to(equal(123))

                    expect(dict[et_keyPath: "translations.characters"] as? Int).to(beNil())

                    expect(dict[et_keyPath: "translations.places"] as? Int).to(beNil())
                }
                it("as Dictionary") {
                    expect(dict[et_keyPath: "language"] as? [String: Any]).to(beNil())
                    expect(dict[et_keyPath: "translations.characters.Gyro Gearloose"] as? [String: Any]).to(beNil())

                    expect(dict[et_keyPath: "int"] as? [String: Any]).to(beNil())
                    expect(dict[et_keyPath: "translations.characters.int"] as? [String: Any]).to(beNil())

                    expect(dict[et_keyPath: "translations.characters"] as? [String: Any]).toNot(beNil())

                    expect(dict[et_keyPath: "translations.places"] as? [String: Any]).to(beNil())
                }
                it("as Array") {
                    expect(dict[et_keyPath: "language"] as? [Any]).to(beNil())
                    expect(dict[et_keyPath: "translations.characters.Gyro Gearloose"] as? [Any]).to(beNil())

                    expect(dict[et_keyPath: "int"] as? [Any]).to(beNil())
                    expect(dict[et_keyPath: "translations.characters.int"] as? [Any]).to(beNil())

                    expect(dict[et_keyPath: "translations.characters"] as? [Any]).to(beNil())

                    expect(dict[et_keyPath: "translations.places"] as? [Any]).toNot(beNil())

                }
            }

            context("write") {

                it("string") {
                    expect(dict[et_keyPath: "translations.characters.New record"]).to(beNil())
                    dict[et_keyPath: "translations.characters.New record"] = "not nil"
                    expect(dict[et_keyPath: "translations.characters.New record"]).toNot(beNil())
                    expect(dict[et_keyPath: "translations.characters.New record"] as? String).to(equal("not nil"))
                }
            }

            context("mutation array") {

                it("append") {
                    let originCount = dict[et_array: "translations.places"]?.count
                    dict[et_array: "translations.places"]?.append("Hi")
                    expect(dict[et_array: "translations.places"]?.count).to(equal(originCount! + 1))
                    expect(dict[et_array: "translations.places"]?.last as? String).to(equal("Hi"))
                }

                it("remove") {
                    let originCount = dict[et_array: "translations.places"]?.count
                    dict[et_array: "translations.places"]?.removeLast()
                    expect(dict[et_array: "translations.places"]?.count).to(equal(originCount! - 1))
                    expect(dict[et_array: "translations.places"]?.last as? String).to(equal("Duckburg"))
                }
            }

            context("mutation dict") {

                it("insert") {
                    let originCount = dict[et_dict: "translations.characters"]?.count
                    dict[et_dict: "translations.characters"]?["New"] = "New record"
                    expect(dict[et_dict: "translations.characters"]?.count).to(equal(originCount! + 1))
                    expect(dict[et_dict: "translations.characters"]?["New"] as? String).to(equal("New record"))
                }

                it("removeAll") {
                    dict[et_dict: "translations.characters"]?.removeAll()
                    expect(dict[et_dict: "translations.characters"]?.count).to(equal(0))
                }
            }

            it("mutation string") {

                expect(dict[et_string: "translations.region"]).to(equal("Czech republic"))
                dict[et_string: "translations.region"]?.append(" is the best!")
                expect(dict[et_string: "translations.region"]).to(equal("Czech republic is the best!"))
            }
        }
    }
}
