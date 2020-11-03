class ViewModelFactory {

    let readingListController = ReadingListController()

    func makeBookListViewModel() -> BookList.ViewModel {
        return BookList.ViewModel(
            books: [Book].dummyAllBooks,
            viewForSelectedBook: { [unowned self] in
                BookDetail(viewModel: self.makeBookDetailViewModel(for: $0))
            }
        )
    }

    func makeBookDetailViewModel(for book: Book) -> BookDetail.ViewModel {
        return BookDetail.ViewModel(book: book, readingListController: readingListController)
    }

    func makeToReadListViewModel() -> ToReadList.ViewModel {
        return ToReadList.ViewModel(readingListController: readingListController)
    }
}
