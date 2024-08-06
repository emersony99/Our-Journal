import SwiftUI

struct EntryCardView: View {
    let entry: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(entry.title)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(entry.date, style: .date)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
            
            Text(entry.content)
                .font(.body)
                .foregroundColor(.white)
                .lineLimit(3)
        }
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
