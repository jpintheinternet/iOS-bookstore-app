//
//  BookList.swift
//  CS4540Book
//
//  Created by Jean Paul Espinosa on 6/17/22.
//

import SwiftUI

struct BookList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    var filteredBooks: [Book] {
        modelData.books.filter { book in
            (!showFavoriteOnly || book.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorite Only")
                }
                
                ForEach(filteredBooks) { book in
                    NavigationLink {
                        BookDetail(book: book)
                    } label: {
                        BookRow(book: book)
                    }
                }
            }
            .navigationTitle("Books")
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
            .environmentObject(ModelData())
    }
}
