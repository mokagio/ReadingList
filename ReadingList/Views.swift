import SwiftUI

struct BookList: View {
    var body: some View {
        List([Book].dummyData) { item in
            Text(item.title)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("I'll get to this later...")
    }
}
#endif
