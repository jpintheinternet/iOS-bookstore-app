//
//  ProfileHost.swift
//  CS4540Book
//
//  Created by Jean Paul Espinosa on 7/8/22.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {    //effectively cancels all edited values
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
