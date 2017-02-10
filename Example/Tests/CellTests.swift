// https://github.com/Quick/Quick

import Quick
import Nimble
import ETUtilities

class CellTests: QuickSpec {

    override func spec() {

        describe("tableView") {

            var tableCell: UITableViewCell!
            var myTableCell: MyTableCell!

            beforeEach {
                tableCell = UITableViewCell()
                myTableCell = MyTableCell()
            }

            context("UITableViewCell") {

                it("et_reuseId") {
                    expect(tableCell.et_reuseId).to(contain("UITableViewCell"))
                }
            }

            context("MyTableCell") {

                it("et_reuseId") {
                    // Description of custom class contains module identificator,
                    // because of that et_reuseId doesn't equal to exact class name.
                    expect(myTableCell.et_reuseId).to(contain("MyTableCell"))
                }
            }
        }

        describe("collectionView") {

            var collectionCell: UICollectionViewCell!
            var myCollectionCell: MyCollectionCell!

            beforeEach {
                collectionCell = UICollectionViewCell()
                myCollectionCell = MyCollectionCell()
            }

            context("UICollectionViewCell") {

                it("et_reuseId") {
                    expect(collectionCell.et_reuseId).to(contain("UICollectionViewCell"))
                }
            }

            context("MyCollectionCell") {

                it("et_reuseId") {
                    // Description of custom class contains module identificator,
                    // because of that et_reuseId doesn't equal to exact class name.
                    expect(myCollectionCell.et_reuseId).to(contain("MyCollectionCell"))
                }
            }
        }
    }

    // MARK: - Helpers

    fileprivate class MyTableCell: UITableViewCell {}
    fileprivate class MyCollectionCell: UICollectionViewCell {}
}
