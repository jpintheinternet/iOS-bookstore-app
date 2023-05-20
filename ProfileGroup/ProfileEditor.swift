//
//  ProfileEditor.swift
//  CS4540Book
//
//  Created by Jean Paul Espinosa on 7/22/22.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Text("User Name: ")
                    .bold()
                Divider()
                TextField("User Name: ", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
                    .bold()
            }
            
            VStack {
                Text("Reading Frequency Photo")
                    .bold()
                Picker("Reading Frequency Photo", selection: $profile.readingFreqPhoto) {
                    ForEach(Profile.readingFreq.allCases) { freq in
                        Text(freq.rawValue).tag(freq)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profile.updateDate, displayedComponents: .date) {
                Text("Last Updated: ")
                    .bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
