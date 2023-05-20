//
//  CategoryRow.swift
//  CS4540Book
//
//  Created by Jean Paul Espinosa on 7/1/22.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Book]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { book in
                        NavigationLink {
                            BookDetail(book: book)
                        } label: {
                            CategoryItem(book: book)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var books = ModelData().books
    static var previews: some View {
        CategoryRow(
            categoryName: books[2].category.rawValue, items: Array(books.prefix(3))
        )
    }
}

/*
 CategoryRow functions to separate all books into lists of the different categories of Math, Novel, and Science.
 It displays one category at a time and calls on CategoryItem to display the selected books within that particular list.
 CategoryRow uses ScrollView to allow the user to browse the list of books past the size limitations of the screen.
    - by swiping to the right, the user can see more books
    - this will be shown during the demo
 For each book in the selected category a link is attached to its image using NavigationLink
    - if it's clicked on the by the user, they are taken to a BookDetail page where more information can be found.
 CategoryRow is called by CategoryHome
    - as this next slide shows
*/
