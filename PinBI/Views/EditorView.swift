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
//    @State private var selectedTag: String? = "Dokumen Baru"
    @State var title: String = "Dokumen Baru"
    @State var content: String = "Ini adalah isi dari dokumen baru"
    
    @Query var documents: [Document]
    
    @State private var selectedDocument: Document?

    var body: some View {
        NavigationSplitView {
            List(selection: $selectedDocument) {
                ForEach(documents) { document in
                    Text(document.title)
                        .tag(document as Document?)
                        .foregroundColor(.gray)
                        .contextMenu() {
                            Button("Delete") {
                                context.delete(document)
                            }
                        }
                }
            }
        } detail: {
            if let selectedDocument = selectedDocument {
                EditorDetailView(content: $content, document: selectedDocument)
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
        let newDocument = Document(title: "\(title) \(documents.count+1)", date: Date(), mistakeList: [], correctText: "", listText: [])
        context.insert(newDocument)
        selectedDocument = newDocument
    }
}

#Preview {
    ContentView()
}
