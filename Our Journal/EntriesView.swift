import SwiftUI

struct JournalEntry: Identifiable {
    let id = UUID()
    let date: Date
    let title: String
    let content: String
}

struct EntriesView: View {
    let journalName: String
    @State private var entries: [JournalEntry] = []
    @State private var showingNewEntrySheet = false
    @State private var newEntryTitle = ""
    @State private var newEntryContent = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.2, green: 0, blue: 0.4), Color(red: 1.0, green: 0.6, blue: 0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .imageScale(.large)
                    }
                    .padding(.leading, 20)
                    
                    Text(journalName)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                        .shadow(radius: 5)
                    
                    Spacer()
                }
                .padding(.top, 20)
                
                if entries.isEmpty {
                    Text("No entries yet. Tap + to add one!")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(entries) { entry in
                                EntryCardView(entry: entry)
                            }
                        }
                        .padding(.top)
                    }
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        showingNewEntrySheet = true
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showingNewEntrySheet) {
            NewEntryView(title: $newEntryTitle, content: $newEntryContent, onSave: saveNewEntry)
        }
    }
    
    func saveNewEntry() {
        let newEntry = JournalEntry(date: Date(), title: newEntryTitle, content: newEntryContent)
        entries.append(newEntry)
        newEntryTitle = ""
        newEntryContent = ""
        showingNewEntrySheet = false
    }
}

// EntryCardView and NewEntryView remain the same as in the previous version

struct EntriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EntriesView(journalName: "Sample Journal")
        }
    }
}
