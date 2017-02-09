// https://github.com/Quick/Quick

import Quick
import Nimble
import ETUtilities

class ImageView: QuickSpec {

    override func spec() {

        describe("et_imageSizeRespectingFrame") {

            var validImageName: String!
            var image: UIImage!
            var imageView: UIImageView!

            beforeEach {

                validImageName = "etnetera-logo"
                image = UIImage(named: validImageName, in: Bundle(for: type(of:self)), compatibleWith: nil)
                imageView = UIImageView(image: image)
            }

            it("image size lt frame size") {

                imageView.frame = CGRect(origin: .zero, size: CGSize(width: image.size.width + 10.0, height: image.size.height + 10.0))

                expect(imageView.et_imageSizeRespectingFrame).to(equal(image.size))
            }

            it("image size eq frame size") {

                imageView.frame = CGRect(origin: .zero, size: CGSize(width: image.size.width, height: image.size.height))

                let expectedSize = CGSize(width: floor(image.size.width), height: floor(image.size.height))

                expect(imageView.et_imageSizeRespectingFrame).to(equal(expectedSize))
            }

            context("image size gt frame size") {

                it("width") {
                    imageView.frame = CGRect(origin: .zero, size: CGSize(width: image.size.width - 10.0, height: image.size.height))

                    var ratio = image.size.width / imageView.frame.size.width
                    var expectedSize = CGSize(width: floor(image.size.width / ratio), height: floor(image.size.height / ratio))

                    expect(imageView.et_imageSizeRespectingFrame).to(equal(expectedSize))

                    imageView.frame = CGRect(origin: .zero, size: CGSize(width: image.size.width - 11.123, height: image.size.height))

                    ratio = image.size.width / imageView.frame.size.width
                    expectedSize = CGSize(width: floor(image.size.width / ratio), height: floor(image.size.height / ratio))

                    expect(imageView.et_imageSizeRespectingFrame).to(equal(expectedSize))

                    imageView.frame = CGRect(origin: .zero, size: CGSize(width: image.size.width - 11.987, height: image.size.height))

                    ratio = image.size.width / imageView.frame.size.width
                    expectedSize = CGSize(width: floor(image.size.width / ratio), height: floor(image.size.height / ratio))

                    expect(imageView.et_imageSizeRespectingFrame).to(equal(expectedSize))
                }
            }
        }
    }
}
