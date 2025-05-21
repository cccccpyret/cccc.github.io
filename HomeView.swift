//
//  Home.swift
//  travelitineray
//
//  Created by Candice Cheung on 20/05/2025.
//

import SwiftUI

struct Continent:Identifiable {
    var id = UUID()
    var name:String
    var color:Color
    var enumVal: Continents
}
var blue_1 = Color.init(red: 138/255, green: 190/255, blue: 234/255)
var blue_2 = Color.init(red: 111/255, green: 148/255, blue: 182/255)
var blue_3 = Color.init(red: 96/255, green: 152/255, blue: 202/255)

struct HomeView: View {
    
    @State private var selectedContinent = Continents.europe
    
    @State var  val:String = ""
    
    var listOfContinents:[Continent] = [
        Continent.init(name: "Europe", color: blue_1, enumVal: .europe),
        Continent.init(name: "Asia", color: blue_2, enumVal: .asia),
        Continent.init(name: "Africa", color: blue_3, enumVal: .africa),
        Continent.init(name: "North America", color: blue_1, enumVal: .northAmerica),
        Continent.init(name: "South America", color: blue_2, enumVal: .southAmerica),
        
    ]
    var body: some View {
        VStack(spacing:0) {
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $val)
                .padding()
                    .background(Color.gray)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Spacer().frame(width:10)
                    ForEach(listOfContinents, id: \.id){thisContinent in
                        
                        Text("\(thisContinent.name)").padding()
                            .background(self.selectedContinent ==
                                thisContinent.enumVal ?
                                thisContinent.color :
                                Color.init(red:0.7, green:0.7, blue:0.7))
                        
                        //<a> ? <b> : <c>
                        //
                        //.background( thisContinent.color)
                        
                        .cornerRadius(10)
                        .font(.system(size: 15, weight: .bold))
                }
                    Spacer().frame(width:10)
                 
            }
            }
            .padding(.bottom, 20).padding(.top, 20)
            .background(Color.clear)
            ScrollView{
                VStack{
                    
                    ForEach(0..<3){ _ in
                        largelocationbutton()
                    }
                }.padding()
                .background(Color.clear)
            }
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
