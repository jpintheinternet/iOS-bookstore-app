//
//  CategoryHome.swift
//  CS4540Book
//
//  Created by Jean Paul Espinosa on 7/1/22.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showingProfile = false
    
    var filteredFeatures: [Book] {
        modelData.books.filter { book in
            (book.isFeatured)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    CategoryRow(categoryName: "",
                                items: (filteredFeatures))
                }
                .listRowInsets(EdgeInsets())
                
//                modelData.features[0].image
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 200)
//                    .clipped()
//                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key,
                                items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
/*
 CategoryHome is culmination of all the previous slides.
 On the top right, it displays the systemImage for the profile.
    - if clicked it displays the ProfileSummary
 Below this, the screen is divided into a list of categories starting with the featured books.
 For each category CategoryRow will be called, which searches within modelData to find the appropriate books.
    - we've also added some functionality to the Featured list
    -- if the user clicks on a featured book image, they will be taken to that book's BookDetail page where they can see more information on that book
 
    -- now I'll pass it on to Hugo, who will be talking about bookData
*/


/*--------------------------------------
 FINAL EXAM -- 8/12 12-1245pm
 10 questions
 Cumulative
 No overlap with Midterm questions
 --------------------------------------*/
