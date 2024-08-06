// EntriesView.swift
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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(entries) { entry in
                    VStack(alignment: .leading) {
                        Text(entry.title)
                            .font(.headline)
                        Text(entry.date, style: .date)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle(journalName)
            .navigationBarItems(trailing: Button(action: {
                showingNewEntrySheet = true
            }) {
                Image(systemName: "plus")
            })
        }
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

struct NewEntryView: View {
    @Binding var title: String
    @Binding var content: String
    let onSave: () -> Void
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextEditor(text: $content)
                    .frame(height: 200)
            }
            .navigationTitle("New Entry")
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    onSave()
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}