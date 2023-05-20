//
//  BookDetail.swift
//  CS4540Book
//
//  Created by Jean Paul Espinosa on 6/24/22.
//

import SwiftUI
//don't need a MapKit

struct BookDetail: View {
    @EnvironmentObject var modelData: ModelData
    var book: Book
    
    var bookIndex: Int {
        modelData.books.firstIndex(where: { $0.id == book.id })!
    }
    
    var body: some View {
        ScrollView {
            BookView(image: book.backgroundImage)
                .ignoresSafeArea(edges: .top)
                .frame(height: 200)
            
            CircleImage(image: book.image)
                .offset(y: -50)
                .padding(.bottom, -50)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(book.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.books[bookIndex].isFavorite)
                }
                
                HStack {
                    Text(book.author)
                    Spacer()
                    Text("$" + String(book.price))
                        .foregroundColor(.blue)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                    .foregroundColor(.blue)
                
                Text("About \(book.name):")
                    .font(.title2)
                Text(book.description)
            }
            .padding()
        }
        .navigationTitle(book.name)
        .navigationBarTitleDisplayMode(.inline)
        //.ignoresSafeArea(edges: .top)
    }
}

struct BookDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        BookDetail(book: modelData.books[0])
            .environmentObject(modelData)
    }
}
