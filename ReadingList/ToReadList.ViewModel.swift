import Combine

extension ToReadList {

    class ViewModel: ObservableObject {

        @Published var books: [BookToRead]

        var readingListController: ReadingListController

        private var cancellables = Set<AnyCancellable>()

        init(readingListController: ReadingListController) {
            self.readingListController = readingListController

            books = readingListController.readingList

            readingListController.$readingList.sink { [weak self] in
                self?.books = $0
            }
            .store(in: &cancellables)
        }
    }
}
