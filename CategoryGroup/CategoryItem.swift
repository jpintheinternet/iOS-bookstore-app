//
//  CategoryItem.swift
//  CS4540Book
//
//  Created by Jean Paul Espinosa on 7/8/22.
//

import SwiftUI

struct CategoryItem: View {
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            book.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(10)
            Text(book.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(book: ModelData().books[2])
    }
}

/*
 CategoryItem is a child view to CategoryRow, it receives data for a particular book and displays the corresponding name and image taken from the JSON file bookData and the assets folder respectively.
 It formats the name and image in such a way that the information can be presented in an organized manner.
    - it resizes the image, adds a frame size, and uses cornerRadius() function to give it a cleaner look.
    - and sets the book name as the caption so it doesn't overshadow the presentation.
 CategoryItem is called by CategoryRow to help manage the way multiple books are displayed together.
    - as we will see in this next slide
*/
