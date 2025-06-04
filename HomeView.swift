import SwiftUI

struct destinationItem:Identifiable {
    var id = UUID()
    var name: String
    var ratingAverage: Double
    var numberOfRatings: Int
    var imageString: String
    var minCost: Int
    var continentVal: Continent
}

var brown_1 = Color(red: 219/255, green: 211/255, blue: 191/255)

struct ContinentInfo: Identifiable {
    var id = UUID()
    var name: String
    var color: Color
    var enumVal: Continent
}

struct HomeView: View {
    
    var listOf_destinations: [destinationItem] = [
        destinationItem(name: "Amsterdam", ratingAverage: 4.7, numberOfRatings: 1036, imageString: "Amsterdam", minCost: 799, continentVal: .europe),
        destinationItem(name: "Paris", ratingAverage: 4.2, numberOfRatings: 2305, imageString: "Paris", minCost: 1099, continentVal: .europe),
        destinationItem(name: "Venice", ratingAverage: 5.0, numberOfRatings: 804, imageString: "Venice", minCost: 1249, continentVal: .europe),
        destinationItem(name: "London", ratingAverage: 3.8, numberOfRatings: 1204, imageString: "London", minCost: 1340, continentVal: .europe),
        destinationItem(name: "Rome", ratingAverage: 4.3, numberOfRatings: 605, imageString: "Rome", minCost: 1100, continentVal: .europe),
        destinationItem(name: "Positano", ratingAverage: 4.6, numberOfRatings: 352, imageString: "Posi", minCost: 759, continentVal: .europe),
        destinationItem(name: "Switzerland", ratingAverage: 4.6, numberOfRatings: 352, imageString: "switzerland", minCost: 759, continentVal: .europe),
        destinationItem(name: "Schwerin", ratingAverage: 4.6, numberOfRatings: 352, imageString: "Schwerin", minCost: 759, continentVal: .europe),
        destinationItem(name: "Yellowknife", ratingAverage: 4.2, numberOfRatings: 2704, imageString: "Yellowknife", minCost: 1049, continentVal: .northAmerica),
        destinationItem(name: "Toronto", ratingAverage: 4.8, numberOfRatings: 1806, imageString: "Toronto", minCost: 699, continentVal: .northAmerica),
        destinationItem(name: "Argentina", ratingAverage: 5.0, numberOfRatings: 804, imageString: "argentina", minCost: 1249, continentVal: .southAmerica),
        destinationItem(name: "Bali", ratingAverage: 3.8, numberOfRatings: 1204, imageString: "bali", minCost: 1340, continentVal: .asia),
        destinationItem(name: "Pakistan", ratingAverage: 3.8, numberOfRatings: 1204, imageString: "Pakistan", minCost: 1340, continentVal: .asia),
        destinationItem(name: "Cebu", ratingAverage: 3.8, numberOfRatings: 1204, imageString: "Cebu", minCost: 1340, continentVal: .asia),
        destinationItem(name: "California", ratingAverage: 4.3, numberOfRatings: 605, imageString: "cali", minCost: 1100, continentVal: .southAmerica),
        destinationItem(name: "New York", ratingAverage: 4.3, numberOfRatings: 605, imageString: "newyork", minCost: 1100, continentVal: .southAmerica),
        destinationItem(name: "Hong Kong", ratingAverage: 4.6, numberOfRatings: 352, imageString: "hongkong", minCost: 759, continentVal: .asia),
        destinationItem(name: "Morroco", ratingAverage: 4.6, numberOfRatings: 352, imageString: "Morroco", minCost: 759, continentVal: .africa),
        destinationItem(name: "Madagascar", ratingAverage: 4.2, numberOfRatings: 2704, imageString: "madagascar", minCost: 1049, continentVal: .africa),
        destinationItem(name: "Cape Town", ratingAverage: 4.3, numberOfRatings: 605, imageString: "capeTown", minCost: 1100, continentVal: .africa),
        destinationItem(name: "Egypt", ratingAverage: 4.6, numberOfRatings: 352, imageString: "Egypt", minCost: 759, continentVal: .africa),
        destinationItem(name: "Madagascar", ratingAverage: 4.2, numberOfRatings: 2704, imageString: "madagascar", minCost: 1049, continentVal: .africa),
        destinationItem(name: "Mexico", ratingAverage: 4.2, numberOfRatings: 2704, imageString: "mexico", minCost: 1049, continentVal: .northAmerica),
        destinationItem(name: "Brazil", ratingAverage: 4.2, numberOfRatings: 2704, imageString: "brazil", minCost: 1049, continentVal: .southAmerica),
    ]
    
    @State private var selectedContinent = Continent.europe
    
    @State var val: String = ""
    
    var listOfContinents: [ContinentInfo] = [
        ContinentInfo(name: "Europe", color: brown_1, enumVal: .europe),
        ContinentInfo(name: "Asia", color: brown_1, enumVal: .asia),
        ContinentInfo(name: "Africa", color: brown_1, enumVal: .africa),
        ContinentInfo(name: "North America", color: brown_1, enumVal: .northAmerica),
        ContinentInfo(name: "South America", color: brown_1, enumVal: .southAmerica)
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [brown_1, Color.white]), startPoint: .init(x: 0, y:0), endPoint: .trailing).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                HStack {
                    Spacer().frame(width:10)
                    TextField("Where do you want to go?", text: $val)
                        .padding()
                        .background(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                        .cornerRadius(10)
                    Spacer().frame(width:10)
                    Spacer().frame(height:80)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer().frame(width: 10)
                        ForEach(listOfContinents, id: \.id) { thisContinent in
                            Button(action: { selectedContinent = thisContinent.enumVal }) {
                                Text("\(thisContinent.name)")
                                    .padding()
                                    .foregroundColor(self.selectedContinent == thisContinent.enumVal ? Color.white : thisContinent.color)
                                    .background(self.selectedContinent == thisContinent.enumVal ? thisContinent.color : Color.gray)
                                    .cornerRadius(10)
                                    .font(.system(size: 15, weight: .bold))
                            }
                        }
                        Spacer().frame(width: 10)
                    .edgesIgnoringSafeArea(.bottom)
                    .background(Color.clear)}
    }
    .padding(.bottom, 20)
            .padding(.top, 20)
            .background(Color.clear)
            ScrollView {
                VStack(spacing:0){
                    ForEach(listOf_destinations, id: \.id) { thisDestination in
                        LargeLocationButton(
                            city: thisDestination.name,
                            cost: thisDestination.minCost,
                            averageRating: thisDestination.ratingAverage,
                            numberOfRatings: thisDestination.numberOfRatings,
                            imageString: thisDestination.imageString, height:
                                self.selectedContinent ==
                            thisDestination.continentVal ? 330 :
                                0)
                        .shadow(radius: self.selectedContinent ==
                                thisDestination.continentVal ? 4 : 0 , y : 4)
                    }
                }
                .padding()
                .background(Color.brown)
            }
            
                Spacer()
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
