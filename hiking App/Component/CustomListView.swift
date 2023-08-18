//
//  CustomListView.swift
//  hiking App
//
//  Created by Vijay Sahoo on 18/08/23.
//

import SwiftUI

struct CustomListView: View {
    // MARK: PROPERTIES
    
    @State var rowLabel:String
    @State var rowIcon:String
    @State var rowContent: String? = nil
    @State var rowTintColor:Color
    @State var rowLinkLabel: String?=nil
    @State var rowLinkDestination: String?=nil
    
    var body: some View {
        LabeledContent{
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
            }
            else if (rowLinkLabel != nil  && rowLinkDestination != nil ){
                Link(rowLinkLabel!,destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            }
            else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
            // Content
        } label: {
            // LABEL
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8.0)
                        .frame(width:30,height: 30)
                        .foregroundColor(rowTintColor)
                        Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

struct CustomListView_Previews: PreviewProvider {
    static var previews: some View {
        List() {
            CustomListView(
                rowLabel: "Website",
                rowIcon: "globe",
                rowContent: nil,
                rowTintColor:.pink,
                rowLinkLabel: "CJ Academy",
                rowLinkDestination: "https://www.linkedin.com/in/vijay-sahoo-ab951b1a9/"
            )
        }
            
    }
}
