//
//  largelocationbutton.swift
//  travelitineray
//
//  Created by Candice Cheung on 20/05/2025.
//

import SwiftUI

struct largelocationbutton: View {
    var body: some View {
        VStack{
            Image(systemName: "")
                .frame(height:200)
                .background(Color.green)
            HStack {
                VStack(alignment: .leading){
                    Text("City")
                        .font(.system(size: 30, weight: .bold))
                    Text("Cost")
                        .foregroundColor(.gray)
                    
                }
                Spacer()
                VStack(alignment: .trailing){
                    HStack{
                        ForEach(0..<4){_ in
                            Image(systemName: "star.fill").foregroundColor(Color.init(red: 220/255, green: 220/255, blue: 0))
                        }
                    }.frame(width:150)
                    HStack{
                        Text("1000+ ratings")
//                          .frame(width: 70)
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                        Text("3.5/5")
                            .font(.system(size: 20))
                            .frame(width: 60)
                    }
                }
            }
            }
        .padding()
        .background(Color.init(red: 0.9, green: 0.9, blue: 0.9))
        .cornerRadius(10)
        }
    }

#Preview {
    largelocationbutton()
}
