//
//  EditorView.swift
//  PinBI
//
//  Created by Syuhada Rantisi on 05/08/24.
//

import SwiftUI
import SwiftData

struct EditorView: View {
    @Environment(\.modelContext) private var context
    @State private var selectedTag: Document? // Update to use Document type
    @State var title: String = "Dokumen Baru"
    @State var content: String = "Ini adalah isi dari dokumen baru"
    
    @Query var documents: [Document]
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedTag) {
                ForEach(documents) { document in
                    Text(document.title)
                        .tag(document)
                        .foregroundColor(.gray)
                        .contextMenu {
                            Button("Delete") {
                                context.delete(document)
                                if selectedTag == document {
                                    selectedTag = nil
                                }
                            }
                        }
                }
            }
        } detail: {
            if let selectedDocument = selectedTag {
                EditorDetailView(document: selectedDocument)
            } else {
                Text("No document selected")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("PinBI")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: addNewDocument) {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
    }
    
    private func addNewDocument() {
        let newDocument = Document(title: "\(title) \(documents.count + 1)", date: Date(), mistakeList: [], correctText: "", listText: [])
        context.insert(newDocument)
        selectedTag = newDocument // Update to set the newly created document as selected
    }
}

#Preview {
    ContentView()
}
