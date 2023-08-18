//
//  SettingsView.swift
//  hiking App
//
//  Created by Vijay Sahoo on 17/08/23.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: PROPERTIES
    
    private let alternateAppIcons:[String]=[ "AppIcon-MagnifyingGlass",
                                             "AppIcon-Mushroom",
                                             "AppIcon-Camera","AppIcon-Map",
                                             "AppIcon-Backpack",
                                             "AppIcon-Campfire"]
    var body: some View {
        List {
            // MARK: SECTION: HEADER
            
            HStack{
                Spacer()
                Image(systemName: "laurel.leading")
                    .font(.system(size: 80,weight: .black))
                VStack(spacing: -10) {
                    Text("Hike")
                        .font(.system(size: 66,weight: .black))
                    Text("Editors' Choicee")
                        .fontWeight(.medium)
                }
                Image(systemName: "laurel.trailing")
                    .font(.system(size: 80,weight: .black))
                Spacer()
            }
            .foregroundStyle(
                LinearGradient(
                    colors: [
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            ).padding(.top,8)
            VStack(spacing:8){
                
                
                Text("Where can you find \nperfect tracks?")
                    .font(.title2)
                    .fontWeight(.heavy)
                
                Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \n the best day hikes in the app,")
                    .font(.footnote)
                    .italic()
                
                Text("Dust off the boots! It's time for a walk.")
                    .fontWeight(.heavy)
                    .foregroundColor(.customGreenMedium)
                
            }
            .multilineTextAlignment(.center)
            .padding(.bottom,16)
            .frame(maxWidth: .infinity)
            // MARK: - SECTION: ICONS
            Section(header:Text("Alternate Icons")){
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices,id:\.self) { item in
                            Button{
                                print("Icon was Pressed.")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) {
                                    error in if error != nil {
                                        print("Failed request to update the app's icons: \(String(describing: error?.localizedDescription))")
                                    }
                                    else{
                                        print("Success ! You have changed the app's icon to \(alternateAppIcons[item])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                        }
                        }
                    }
                }.padding(.top,12)
                //: SCROLL VIEW
                
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom,12)
            } //: SECTION
            .listRowSeparator(.hidden)
            // MARK: SECTION: ABOUT
            
            
            Section (
                header:Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright @ All right reserved.")
                    Spacer()
                }
                    .padding(.vertical,8)
            ){
                //1. Basic Labeled Content
              //  LabeledContent("Application",value:"Hike")
                
                //2. Advanced Labled Content
                CustomListView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "IOS,iPadOS", rowTintColor: .red)
                
                CustomListView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListView(rowLabel: "Version", rowIcon:"gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Vijay Sahoo", rowTintColor: .mint)
                
                CustomListView(rowLabel: "Desinger", rowIcon: "paintpalette", rowContent: "Carl Johnson", rowTintColor: .pink)
                
                CustomListView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel:"CJ Academy",rowLinkDestination: "https://www.linkedin.com/in/vijay-sahoo-ab951b1a9/")
            }

        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
