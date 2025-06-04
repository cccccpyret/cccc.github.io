//
//  LargeLocationButton.swift
//  Travel Itinerary
//
//  Created by Candice Cheung on 27/05/2025.
//

import SwiftUI

struct LargeLocationButton: View {
    
    var city:String
    var cost:Int
    var averageRating:Double
    var numberOfRatings:Int
    var imageString:String
    var height:CGFloat = 330
    
    private var formattedAverageRating: String {
            let averageRatingString = String(averageRating)
            let splitRating = averageRatingString.split(separator: ".")
            let decimalPart = splitRating.count > 1 ? String(splitRating[1]) : "0"
            return "\(splitRating[0]).\(decimalPart) / 5"
        }
    
    var body: some View {
        VStack(spacing:0){
            
            Image(imageString)
                .resizable()
                .scaledToFill()
                .frame(minWidth:0, maxWidth: .infinity)
                .frame(height:200)
            
                .background(Color.green)
                .clipped()
            HStack {
                VStack(alignment: .leading){
                    Text(city)
                        .font(.system(size: 30, weight: .bold))
                    Text("Starting at $\(cost)+")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                }
                Spacer()
                VStack(alignment: .trailing){
                    HStack{
                        Spacer()
                        ForEach(0..<Int(averageRating.rounded()), id: \.self) { _ in
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.init(red: 220/255, green: 220/255, blue: 0))
                                .font(.system(size: 15))
                        }
                    }.frame(width:150)
                    HStack{
                        Text("\(numberOfRatings)+ ratings")
                            .frame(width: 70)
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                        
                        Text(formattedAverageRating)
                            .font(.system(size: 20))
                            .frame(width: 60)
                    }
                }
            }.frame(height:70)
            .padding()
        }
        
        
        .background(Color.init(red: 0.9, green: 0.9, blue: 0.9))
        .cornerRadius(10)
        //.shadow(radius:4, y:4)
        .frame(height: height)
        .clipped()
        
    }
}

#Preview {
    LargeLocationButton(city: "City", cost: 0, averageRating: 2, numberOfRatings: 1000, imageString: "Amsterdam")
}
