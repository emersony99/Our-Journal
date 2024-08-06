// JournalView.swift
import SwiftUI

struct JournalFolder: Identifiable {
    let id = UUID()
    let profileImageName: String
    let journalName: String
    let description: String
    let journalType: String
}

struct JournalView: View {
    @State private var journals = [
        JournalFolder(profileImageName: "profile1", journalName: "My Journal", description: "All about me, by me!", journalType: "personal"),

    ]
    
    @State private var showCreateJournalSheet = false
    @State private var journalName = ""
    @State private var selectedJournalType = "Personal Journal"
    
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0.2, green: 0, blue: 0.4), Color(red: 1.0, green: 0.6, blue: 0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Journal")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.white)
                            .padding([.leading, .top], 20)
                            .shadow(radius: 5)
                        Spacer()
                    }
                    
                    ScrollView {
                        VStack(alignment: .center, spacing: 20) {
                                ForEach(journals) { journal in
                                    NavigationLink(destination: EntriesView(journalName: journal.journalName)) {
                                        GeometryReader { geometry in
                                            HStack(alignment: .top) {
                                                Image(journal.profileImageName)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 60, height: 60)
                                                    .clipShape(Circle())
                                                    .padding(.trailing, 10)
                                                
                                                VStack(alignment: .leading) {
                                                    HStack {
                                                        Text(journal.journalName)
                                                            .font(.headline)
                                                            .foregroundColor(.white)
                                                        
                                                        Image(systemName: journal.journalType == "shared" ? "person.2.fill" : "person.fill")
                                                            .foregroundColor(.white)
                                                            .padding(.leading, 5)
                                                    }
                                                    
                                                    Text(journal.description)
                                                        .font(.subheadline)
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.vertical, 30)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            }
                                            .padding(.horizontal)
                                            .background(Color.white.opacity(0.2))
                                            .cornerRadius(10)
                                            .frame(width: geometry.size.width - 40)
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 100)
                                    }
                                }
                        }
                        .padding(.top)
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showCreateJournalSheet.toggle()
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
                
                if showCreateJournalSheet {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showCreateJournalSheet = false
                        }
                    
                    VStack {
                        Spacer()
                        VStack {
                            Text("Create Journal")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top, 20)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                HStack {
                                    Image(systemName: "book.fill")
                                    Text("Personal Journal")
                                    Spacer()
                                    if selectedJournalType == "Personal Journal" {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding()
                                .background(selectedJournalType == "Personal Journal" ? Color.gray.opacity(0.2) : Color.clear)
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedJournalType = "Personal Journal"
                                }
                                
                                HStack {
                                    Image(systemName: "person.2.fill")
                                    Text("Shared Journal")
                                    Spacer()
                                    if selectedJournalType == "Shared Journal" {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding()
                                .background(selectedJournalType == "Shared Journal" ? Color.gray.opacity(0.2) : Color.clear)
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedJournalType = "Shared Journal"
                                }
                            }
                            .padding()
                            
                            TextField("Enter Journal Name", text: $journalName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            
                            Button(action: {
                                // Add the new journal to the array
                                let newJournal = JournalFolder(
                                    profileImageName: "profileDefault", // Replace with the appropriate image name
                                    journalName: journalName,
                                    description: "New Journal Description", // Placeholder description, you can update as needed
                                    journalType: selectedJournalType == "Personal Journal" ? "personal" : "shared"
                                )
                                journals.append(newJournal)
                                showCreateJournalSheet = false
                                journalName = "" // Reset the journal name field
                            }) {
                                Text("Create")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 20)
                        }
                        .background(LinearGradient(
                            gradient: Gradient(colors: [Color(red: 0.2, green: 0, blue: 0.4), Color(red: 1.0, green: 0.6, blue: 0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Journal")
            .navigationBarHidden(true)
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}


