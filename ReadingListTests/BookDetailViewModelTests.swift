import Combine
@testable import ReadingList
import XCTest

class BookDetailViewModelTests: XCTestCase {

    let dummyBook = Book(title: "title", author: "author")
    var cancellables = Set<AnyCancellable>()

    func testAddOrRemoveButtonTitleIsAddWhenBookIsNotInReadingList() {
        let controller = ReadingListController()
        let book = dummyBook
        let viewModel = BookDetailViewModel(book: book, readingListController: controller)

        XCTAssertFalse(controller.isBookInList(book))
        XCTAssertEqual(viewModel.addOrRemoveButtonText, "Add to reading list")
    }

    func testAddOrRemoveButtonTitleIsRemoveWhenBookIsInReadingList() {
        let controller = ReadingListController()
        let book = dummyBook
        controller.add(book)
        XCTAssertTrue(controller.isBookInList(book))

        let viewModel = BookDetailViewModel(book: book, readingListController: controller)

        XCTAssertEqual(viewModel.addOrRemoveButtonText, "Remove from reading list")
    }
}
