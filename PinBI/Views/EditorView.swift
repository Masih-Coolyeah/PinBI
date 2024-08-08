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
    @State private var selectedTag: Document?
    
    @Query var documents: [Document]
    
    @State private var editingDocument: Document?
    @State private var renamingDocument: Document?
    @State private var newTitle: String = ""
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedTag) {
                ForEach(documents) { document in
                    if renamingDocument == document {
                        TextField("Enter new name", text: $newTitle, onCommit: {
                            document.title = newTitle
                            try? context.save()
                            renamingDocument = nil
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(2)
                    } else {
                        Text(document.title)
                            .tag(document)
                            .foregroundColor(.gray)
                            .contextMenu {
                                Button("Hapus") {
                                    context.delete(document)
                                    if selectedTag == document {
                                        selectedTag = nil
                                    }
                                }
                                Button("Ganti Nama") {
                                    renamingDocument = document
                                    newTitle = document.title
                                }
                            }
                    }
//                    Text(document.title)
//                        .tag(document)
//                        .foregroundColor(.gray)
//                        .contextMenu {
//                            Button("Hapus") {
//                                context.delete(document)
//                                if selectedTag == document {
//                                    selectedTag = nil
//                                }
//                            }
//                            Button("Ganti Nama") {
//                                print("Update Document")
//                            }
//                        }
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
        let newDocument = Document(title: "Dokumen Baru \(documents.count + 1)", date: Date(), mistakeList: [], correctText: "", listText: [])
        context.insert(newDocument)
        selectedTag = newDocument
    }
    
}


#Preview {
    ContentView()
}
