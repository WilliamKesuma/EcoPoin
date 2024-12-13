import SwiftUI

struct ContentView: View {
    let BrownColor = Color(red: 84/255, green: 71/255, blue: 63/255)
    let GreenColor = Color(red: 203/255, green: 210/255, blue: 165/255)
    let SoftBrownColor = Color(red: 154/255, green: 126/255, blue: 111/255)
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                GreenColor
                    .ignoresSafeArea() // Membuat background memenuhi layar
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Good Morning, user!")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(BrownColor)
                            Text("Have you throw out your trash?")
                                .font(.subheadline)
                                .foregroundColor(SoftBrownColor)
                        }
                        Spacer()
                        Image("profil") // Ganti dengan nama gambar yang ada di Assets
                            .resizable() // Agar gambar bisa diubah ukurannya
                            .scaledToFit() // Menjaga rasio gambar
                            .clipShape(Circle()) // Membuat gambar berbentuk lingkaran
                            .frame(width: 100, height: 100) // Ukuran gambar
                    }
                    .padding() // Menambahkan padding di sekitar HStack
                    
                    Spacer() // Membuat bagian atas tetap kosong
                    
                    // Bagian putih dengan sudut membulat
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .ignoresSafeArea(edges: .bottom)
                            .frame(height: UIScreen.main.bounds.height * 0.73) // Menentukan tinggi sesuai proporsi layar
                            .shadow(radius: 5) // Menambahkan bayangan
                        
                        VStack {
                            ScrollView {
                                VStack(spacing: 16) {
                                    HStack {
                                        TextField("Search for trashes...", text: .constant(""))
                                            .padding(10)
                                            .background(Color.gray.opacity(0.2))
                                            .cornerRadius(10)
                                        
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.horizontal)
                                    
                                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                                        // Manual WasteCards with NavigationLink
                                        NavigationLink(destination: DetailView(title: "Paper waste")) {
                                            WasteCard(title: "Paper waste", imageName: "kertas")
                                        }
                                        NavigationLink(destination: DetailView(title: "Plastic waste")) {
                                            WasteCard(title: "Plastic waste", imageName: "plastik")
                                        }
                                        NavigationLink(destination: DetailView(title: "Oil waste")) {
                                            WasteCard(title: "Oil waste", imageName: "minyak")
                                        }
                                        NavigationLink(destination: DetailView(title: "Food waste")) {
                                            WasteCard(title: "Food waste", imageName: "foodwaste")
                                        }
                                        NavigationLink(destination: DetailView(title: "Glass waste")) {
                                            WasteCard(title: "Glass waste", imageName: "glass")
                                        }
                                        NavigationLink(destination: DetailView(title: "Fabric waste")) {
                                            WasteCard(title: "Fabric waste", imageName: "kain")
                                        }
                                        NavigationLink(destination: DetailView(title: "Electronic Waste")) {
                                            WasteCard(title: "Electronic Waste", imageName: "electronicwaste")
                                        }
//                                        NavigationLink(destination: DetailView(title: "Wood waste")) {
//                                            WasteCard(title: "Wood waste")
//                                        }
                                        
                                        
                                    }
                                    .padding()
                                    Spacer().frame(height: 100)
                                }
                            }
                            .frame(maxHeight: .infinity, alignment: .top) // Menempatkan di atas secara vertikal
                            .padding(.top, 20)
                        }
                    }
                }
                
                VStack {
                    Spacer() // Membuat bagian atas tetap kosong
                    
                    // Bagian putih dengan sudut membulat
                    RoundedRectangle(cornerRadius: 30)
                        .fill(GreenColor)
                        .ignoresSafeArea(edges: .bottom)
                        .frame(height: UIScreen.main.bounds.height * 0.1) // Menentukan tinggi sesuai proporsi layar
                        .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 3) // Menambahkan bayangan
                }
            }
            .navigationBarHidden(true) // Menyembunyikan navigation bar default
        }
    }
}

// WasteCard component
struct WasteCard: View {
    let BrownColor = Color(red: 84/255, green: 71/255, blue: 63/255)
    var title: String
    var imageName: String // Added imageName to pass the image
    
    var body: some View {
        VStack {
            // Display the image using the imageName
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .cornerRadius(10)
                .clipped() // Ensures image doesn't spill outside the corner radius
            
            Text(title)
                .font(.headline)
                .padding(.vertical, 5)
                .foregroundColor(BrownColor)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

import SwiftUI
struct DetailView: View {
    let GreenColor = Color(red: 203/255, green: 210/255, blue: 165/255)
    let SoftBrownColor = Color(red: 154/255, green: 126/255, blue: 111/255)
    var title: String
    
    var body: some View {
        VStack {
            ScrollView {
                ZStack {
                    // Latar belakang hijau
                    GreenColor
                        .ignoresSafeArea()
                    
                    // Area putih (RoundedRectangle) dan isinya
                    ZStack {
                        // RoundedRectangle sebagai area putih
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .shadow(radius: 5)
                            .frame(maxHeight: .infinity)
                            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 4.1 / 4)
                        
                        if title.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "paper waste" {
                            VStack {
                                
                                Text("Paper Waste")
                                    .font(.system(size: 23, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.brown)
                                    .cornerRadius(8)
                                    .padding(.bottom, 1150)
                                    .padding(.trailing, 150)
                            }
                            .frame(maxHeight: .infinity) // Ensure the text is centered vertically
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Image("kertas") // Use the image named "kertas" from Assets.xcassets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200) // Adjust the height of the image
                                    .cornerRadius(10)
                                
                                // Definition and Types of Paper Waste
                                Text("Definition and Types")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Paper waste refers to discarded paper-based materials that are commonly found in homes, offices, or schools. Types include:
                                        - Office Paper: such as documents and books.
                                        - Cardboard: used storage boxes.
                                        - Newspapers & Magazines: printed media.
                                        - Used Paper: such as wrapping paper or tissues.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Easy Ways to Reuse Paper
                                Text("Easy Ways to Reuse Paper")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - Many printed papers only use one side. You can cut them into small pieces and use the unused side for notes.
                                        - Don’t throw away old newspapers. You can save them to wrap gifts.
                                        - Transform old and used paper into decorations for birthday parties or formal events.
                                        - Reuse cardboard to store inventory.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Environmental Impact of Paper Waste
                                Text("Environmental Impact")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Paper waste that is not properly managed can pollute the land and water, and produce harmful methane gas if dumped in landfills.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Interesting Facts about Paper Waste
                                Text("Interesting Facts")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - Recycling paper can save up to 60% energy compared to producing paper from new raw materials.
                                        - On average, each person generates around 2.6 kilograms of paper waste per month.
                                        - Recycled paper can be used to create new products such as packaging boxes, tissue paper, and building materials.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                Text("Recycling Points System")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("Point Details:")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - 1 kg of paper = 5 points
                                        - 5 kg of paper = 25 points
                                        - 10 kg of paper = 50 points
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 210)
                        }
                        
                        if title.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "plastic waste" {
                            VStack {
                                Text("Plastic Waste")
                                    .font(.system(size: 23, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.brown)
                                    .cornerRadius(8)
                                    .padding(.bottom, 1150)
                                    .padding(.trailing, 150)
                            }
                            .frame(maxHeight: .infinity)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Image("plastik") // Use the image named "plastik" from Assets.xcassets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                                    .cornerRadius(10)
                                
                                // Definition and Types of Plastic Waste
                                Text("Definition and Types")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Plastic waste refers to discarded plastic-based materials commonly found in homes, offices, or schools. Types include:
                                        - Packaging Plastics: such as plastic bags and bottles.
                                        - Used Plastics: such as straws and food wrappers.
                                        - Rigid Plastics: such as toys and plastic containers.
                                        - Thin Plastics: such as single-use food wrappers.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Easy Ways to Reuse Plastic Waste
                                Text("Easy Ways to Reuse Plastic Waste")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - Reuse plastic bags for shopping or storing items.
                                        - Turn used plastic bottles into plant pots or pencil holders.
                                        - Repurpose used plastic into crafts, such as bags or wallets.
                                        - Don’t throw away straws, wash and reuse them when needed.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Environmental Impact of Plastic Waste
                                Text("Environmental Impact")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Plastic waste that is not properly managed can pollute the oceans and land, threatening marine life and animals that consume plastic.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Interesting Facts about Plastic Waste
                                Text("Interesting Facts")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - Plastic takes hundreds of years to decompose in the environment.
                                        - It is estimated that 8 million tons of plastic enter the ocean every year.
                                        - Only about 9% of plastic is recycled worldwide.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Recycling Points System
                                Text("Recycling Points System")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("Point Details:")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - 1 kg of plastic = 5 points
                                        - 5 kg of plastic = 25 points
                                        - 10 kg of plastic = 50 points
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 210)
                        }
                        if title.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "oil waste" {
                            VStack {
                                Text("Oil Waste")
                                    .font(.system(size: 23, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .padding(.horizontal, 15)
                                    .background(Color.brown)
                                    .cornerRadius(8)
                                    .padding(.bottom, 1100)
                                    .padding(.trailing, 150)
                            }
                            .frame(maxHeight: .infinity)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Image("minyak")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                                    .cornerRadius(10)
                                
                                // Definition and Types of Oil Waste
                                Text("Definition and Types")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Oil waste refers to waste derived from used cooking oils or fuel oils that are no longer needed. Types include:
                                        - Used Cooking Oil: oil that has been used for cooking.
                                        - Fuel Waste: such as used vehicle oils.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Easy Ways to Manage Oil Waste
                                Text("Easy Ways to Manage Oil Waste")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - If the oil gets dirty after cooking, it can be cleaned again using natural materials like flour, rice, activated charcoal, potatoes, or banana peels to filter the impurities from the used oil. After filtering, the oil can be reused for frying.
                                        - Repurpose used cooking oil as lamp oil as an alternative lighting source.
                                        - Use used oil as a base material to make aromatherapy candles.
                                        """)
                                
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Environmental Impact of Oil Waste
                                Text("Environmental Impact")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                    Improper disposal of oil waste can harm land and water. In water, it blocks oxygen, affecting aquatic life. On land, it contaminates soil and groundwater, threatening plants, wildlife, and humans. Oil waste also contains harmful chemicals that cause long-term environmental damage. Proper disposal and recycling are essential to prevent these issues.
                                    """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Interesting Facts about Oil Waste
                                Text("Interesting Facts")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - Oil waste can damage water and soil quality, making proper processing essential.
                                        - Used cooking oil can be converted into biodiesel fuel.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Recycling Points System
                                Text("Recycling Points System")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("Point Details:")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - 1 liter of oil = 5 points
                                        - 5 liters of oil = 25 points
                                        - 10 liters of oil = 50 points
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 210)
                        }
                        if title.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "food waste" {
                            VStack {
                                Text("Food Waste")
                                    .font(.system(size: 23, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.brown)
                                    .cornerRadius(8)
                                    .padding(.bottom, 1150)
                                    .padding(.trailing, 150)
                            }
                            .frame(maxHeight: .infinity) // Ensure the text is centered vertically
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Image("foodwaste") // Use the image named "food_waste" from Assets.xcassets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200) // Adjust the height of the image
                                    .cornerRadius(10)
                                
                                // Definition and Types of Food Waste
                                Text("Definition and Types")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Food waste refers to food that is discarded or left uneaten. Types include:
                                        - Leftovers: food from meals that aren’t finished.
                                        - Expired Food: products past their best-before dates.
                                        - Spoiled Food: food that has gone bad due to improper storage.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Easy Ways to Reduce Food Waste
                                Text("Easy Ways to Reduce Food Waste")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                         - Turn food scraps into compost, which can be used to enrich soil.
                                         - Use food scraps as animal feed to reduce waste and help local farmers.
                                         - Process food scraps into liquid fertilizer, which can be used to nourish plants.
                                         - Create products from food waste materials, like biodegradable packaging or eco-friendly products.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Environmental Impact of Food Waste
                                Text("Environmental Impact")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Food waste contributes to greenhouse gas emissions in landfills, wasting valuable resources like water and energy. It also leads to nutrient loss that could help feed those in need, worsening global hunger.
                                        """)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                
                                // Interesting Facts about Food Waste
                                Text("Interesting Facts")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - Approximately one-third of the food produced globally is wasted.
                                        - The average person wastes about 100 kilograms of food each year.
                                        - Wasting food also wastes the resources used to produce, process, and transport it.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                Text("Recycling Points System")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("Point Details:")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - 2 kg of food = 5 points
                                        - 12 kg of food = 25 points
                                        - 24 kg of food = 50 points
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 210)
                        }
                        if title.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "glass waste" {
                            VStack {
                                Text("Glass Waste")
                                    .font(.system(size: 23, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.brown)
                                    .cornerRadius(8)
                                    .padding(.bottom, 1200)
                                    .padding(.trailing, 150)
                            }
                            .frame(maxHeight: .infinity) // Ensure the text is centered vertically
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Image("glass") // Use the image named "glass" from Assets.xcassets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200) // Adjust the height of the image
                                    .cornerRadius(10)
                                
                                // Definition and Types of Glass Waste
                                Text("Definition and Types")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Glass waste refers to discarded glass materials such as bottles, jars, and containers. Types of glass waste include:
                                        - Beverage Bottles: used glass bottles from drinks.
                                        - Food Containers: jars and other food-related packaging.
                                        - Window Glass: glass from broken windows or mirrors.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Easy Ways to Reuse Glass
                                Text("Easy Ways to Reuse Glass")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - Repurpose glass jars to store food, cosmetics, or as decorative items.
                                        - Use glass bottles as flower vases or candle holders.
                                        - Create homemade art by painting glass bottles and using them as lamp bases or centerpieces.
                                        - Recycle glass containers for new products, such as tiles, insulation materials, or road construction aggregates.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Environmental Impact of Glass Waste
                                Text("Environmental Impact")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Glass waste takes thousands of years to decompose and can harm wildlife when improperly disposed. Glass production is energy-intensive and contributes to CO2 emissions, while recycling helps reduce energy use and pollution.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Interesting Facts about Glass Waste
                                Text("Interesting Facts")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - Glass is 100% recyclable and can be recycled endlessly without loss of quality or purity.
                                        - Recycling glass saves up to 30% of the energy required to produce new glass.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Recycling Points System
                                Text("Recycling Points System")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("Point Details:")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - 1 kg of glass = 5 points
                                        - 5 kg of glass = 25 points
                                        - 10 kg of glass = 50 points
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 210)
                        }
                        if title.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "fabric waste" {
                            VStack {
                                
                                Text("Fabric Waste")
                                    .font(.system(size: 23, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.brown)
                                    .cornerRadius(8)
                                    .padding(.bottom, 1100)
                                    .padding(.trailing, 150)
                            }
                            .frame(maxHeight: .infinity) // Ensure the text is centered vertically
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Image("kain") // Use the image named "kain" from Assets.xcassets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200) // Adjust the height of the image
                                    .cornerRadius(10)
                                
                                // Definition and Types of Fabric Waste
                                Text("Definition and Types")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Fabric waste refers to discarded textile materials from homes. Common types include:
                                        - Old clothing: Clothes that are no longer worn due to size changes, damage, or outdated fashion.
                                        - Towels and Linens: Items like old towels, bed sheets, or curtains that are no longer usable.
                                        - Fabric Scraps: Small pieces of fabric left over from sewing or craft projects.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Easy Ways to Reuse Fabric
                                Text("Easy Ways to Reuse Fabric")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - Turn old clothes into rags for cleaning.
                                        - Use fabric scraps for DIY projects like making bags or cushions.
                                        - Upcycle old towels into home décor items or pet bedding.
                                        - Donate gently used clothing to charity.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Environmental Impact of Fabric Waste
                                Text("Environmental Impact")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Fabric waste can contribute to landfills if not recycled. Some textiles, especially synthetic fabrics, can take decades to decompose. Recycling fabric reduces the need for virgin materials and helps minimize pollution.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Interesting Facts about Fabric Waste
                                Text("Interesting Facts")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - The fashion industry is responsible for a large amount of fabric waste, with billions of pounds of textiles ending up in landfills each year.
                                        - Recycling fabrics can reduce the carbon footprint of textile production.
                                        - Upcycled fabric can be used in new products, from fashion to home furnishings.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                Text("Recycling Points System")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("Point Details:")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - 1 kg of fabric = 5 points
                                        - 5 kg of fabric = 25 points
                                        - 10 kg of fabric = 50 points
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 210)
                        }
                        if title.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "electronic waste" {
                            VStack {
                                Text("Electronic Waste")
                                    .font(.system(size: 23, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.brown)
                                    .cornerRadius(8)
                                    .padding(.bottom, 1150)
                                    .padding(.trailing, 150)
                            }
                            .frame(maxHeight: .infinity) // Ensure the text is centered vertically
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Image("electronicwaste")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200) // Adjust the height of the image
                                    .cornerRadius(10)
                                
                                // Definition and Types of Electronic Waste
                                Text("Definition and Types")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Electronic waste refers to discarded electrical or electronic devices. Common types include:
                                        - Electronic Gadgets: Old or damaged smartphones, ameras, music player, etc
                                        - Computers: Laptops, desktops, and peripherals.
                                        - Home Appliances: Televisions, refrigerators, microwaves, etc.
                                        - Batteries: Discarded rechargeable and single-use batteries.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Easy Ways to Reuse Electronic Waste
                                Text("Easy Ways to Reuse Electronic Waste")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - Donate old devices that still work to charity or community organizations.
                                        - Use old gadgets for DIY projects or educational purposes.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Environmental Impact of Electronic Waste
                                Text("Environmental Impact")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        Electronic waste contains toxic chemicals such as lead, mercury, and cadmium. If not recycled properly, these substances can leach into the soil and water, causing pollution and posing risks to human health.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Interesting Facts about Electronic Waste
                                Text("Interesting Facts")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - Over 50 million metric tons of e-waste are produced globally each year.
                                        - E-waste accounts for 70% of the toxic waste found in landfills.
                                        - Only around 20% of e-waste is properly recycled, the rest is either disposed of improperly or incinerated.
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                                // Recycling Points System
                                Text("Recycling Points System")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("Point Details:")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text("""
                                        - 1 kg of electronic waste = 10 points
                                        - 5 kg of electronic waste = 50 points
                                        - 10 kg of electronic waste = 100 points
                                        """)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 210)
                        }

                        
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "Electronic Waste")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
