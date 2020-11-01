class ViewModelFactory {

    let readingListController = ReadingListController()

    func makeBookListViewModel() -> BookListViewModel {
        return BookListViewModel(
            books: [Book].dummyAllBooks,
            viewForSelectedBook: { [unowned self] in
                BookDetail(viewModel: self.makeBookDetailViewModel(for: $0))
            }
        )
    }

    func makeBookDetailViewModel(for book: Book) -> BookDetailViewModel {
        return BookDetailViewModel(book: book, readingListController: readingListController)
    }

    func makeToReadListViewModel() -> ToReadListViewModel {
        return ToReadListViewModel(readingListController: readingListController)
    }
}
