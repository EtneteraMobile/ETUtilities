// https://github.com/Quick/Quick

import Quick
import Nimble
import ETUtilities

class ViewFrameAdjustableTests: QuickSpec {
    
    override func spec() {
        
        describe("view") {
            
            var view: UIView!
            
            beforeEach {
                view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
            }
            
            context("width") {
                let newWidth: CGFloat = 300
                
                it("get") {
                    view.frame.size.width = newWidth
                    expect(view.width).to(equal(newWidth))
                }
                
                it("set") {
                    view.width = newWidth
                    expect(view.frame.width).to(equal(newWidth))
                }
            }
            
            context("height") {
                let newHeight: CGFloat = 300
                
                it("get") {
                    view.frame.size.height = newHeight
                    expect(view.height).to(equal(newHeight))
                }
                
                it("set") {
                    view.height = newHeight
                    expect(view.frame.height).to(equal(newHeight))
                }
            }
            
            context("top") {
                let top: CGFloat = 300
                
                it("get") {
                    view.frame.origin.y = top
                    expect(view.top).to(equal(top))
                }
                
                it("set") {
                    view.top = top
                    expect(view.frame.origin.y).to(equal(top))
                }
            }
            
            context("bottom") {
                let bottom: CGFloat = 300
                
                it("get") {
                    view.frame.origin.y = bottom - view.frame.height
                    expect(view.bottom).to(equal(bottom))
                }
                
                it("set") {
                    view.bottom = bottom
                    expect(view.frame.origin.y + view.frame.height).to(equal(bottom))
                }
            }
            
            context("left") {
                let left: CGFloat = 300
                
                it("get") {
                    view.frame.origin.x = left
                    expect(view.left).to(equal(left))
                }
                
                it("set") {
                    view.left = left
                    expect(view.frame.origin.x).to(equal(left))
                }
            }
            
            context("right") {
                let right: CGFloat = 300
                
                it("get") {
                    view.frame.origin.x = right - view.frame.width
                    expect(view.right).to(equal(right))
                }
                
                it("set") {
                    view.right = right
                    expect(view.frame.origin.x + view.frame.width).to(equal(right))
                }
            }
            
            context("bounds.center.x") {
                let boundsCenterX: CGFloat = 300
                
                it("get") {
                    view.bounds.origin.x = boundsCenterX - view.bounds.width / 2
                    expect(view.bounds.center.x).to(equal(boundsCenterX))
                }
                
                it("set") {
                    view.bounds.center.x = boundsCenterX
                    expect(view.bounds.origin.x + view.bounds.width / 2).to(equal(boundsCenterX))
                }
            }
            
            context("bounds.center.y") {
                let boundsCenterY: CGFloat = 300
                
                it("get") {
                    view.bounds.origin.y = boundsCenterY - view.bounds.height / 2
                    expect(view.bounds.center.y).to(equal(boundsCenterY))
                }
                
                it("set") {
                    view.bounds.center.y = boundsCenterY
                    expect(view.bounds.origin.y + view.bounds.height / 2).to(equal(boundsCenterY))
                }
            }
            
        }
    }
}
