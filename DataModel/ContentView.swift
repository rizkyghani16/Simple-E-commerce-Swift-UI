//
//  ContentView.swift
//  DataModel
//
//  Created by Rizky Abdul Ghani S on 09/10/20.
//

import SwiftUI

// model data
struct ProductModel: Identifiable {
    let id : Int
    let productName : String
    let productPhoto : String
    let productPrice : Int
    let productLocation : String
    let ratingCount : Int
    let ratingSum : Int
    
    init(id: Int, productName: String, productPhoto: String, productPrice: Int, productLocation: String, ratingCount: Int, ratingSum: Int) {
        
        self .id = id
        self .productName = productName
        self .productPhoto = productPhoto
        self .productPrice = productPrice
        self .productLocation = productLocation
        self .ratingCount = ratingCount
        self .ratingSum = ratingSum
        
    }
    
}
struct ContentView: View {
    
    //Data baru
    let data : [ProductModel] = [
        ProductModel(id: 1, productName: "Sepatu Bagus", productPhoto: "sneakers1", productPrice: 5500000, productLocation: "Bandung", ratingCount: 4, ratingSum: 48),
        ProductModel(id: 2, productName: "Sepatu Edun", productPhoto: "sneakers2", productPrice: 6000000, productLocation: "Bandung", ratingCount: 5, ratingSum: 50),
        ProductModel(id: 3, productName: "Sepatu Manjiw", productPhoto: "sneakers3", productPrice: 8000000, productLocation: "Bandung", ratingCount: 4, ratingSum: 66),
        ProductModel(id: 4, productName: "Sepatu Icikiwir", productPhoto: "sneakers4", productPrice: 7000000, productLocation: "Bandung", ratingCount: 5, ratingSum: 74),
        ProductModel(id: 5, productName: "Sepatu Orang", productPhoto: "sneakers5", productPrice: 6500000, productLocation: "Bandung", ratingCount: 4, ratingSum: 80),
        ProductModel(id: 6, productName: "Sepatu Madog", productPhoto: "sneakers6", productPrice: 10000000, productLocation: "Bandung", ratingCount: 4, ratingSum: 99),
        ProductModel(id: 7, productName: "Sepatu Buluk", productPhoto: "sneakers7", productPrice: 3000000, productLocation: "Bandung", ratingCount: 5, ratingSum: 121),
        ProductModel(id: 8, productName: "Sepatu Anjim", productPhoto: "sneakers8", productPrice: 9000000, productLocation: "Bandung", ratingCount: 4, ratingSum: 18),
        ProductModel(id: 9, productName: "Sepatu Bekas", productPhoto: "sneakers9", productPrice: 5100000, productLocation: "Bandung", ratingCount: 4, ratingSum: 6),
        ProductModel(id: 10, productName: "Sepatu Saha", productPhoto: "sneakers10", productPrice: 5500000, productLocation: "Bandung", ratingCount: 4, ratingSum: 10)
    ]
    
    @State var jumlahKeranjang: Int = 10
    
    var body: some View {
        //        Product()
        
        NavigationView{
            ScrollView{
                ForEach(data){
                    row in
                    VStack(spacing: 10){
                        Product(data: row, jumlahProduct: $jumlahKeranjang)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Product")
            .navigationBarItems(trailing:
                                    HStack(spacing: 20){
                                        
                                        keranjangView(jumlah: $jumlahKeranjang)
                                        
                                        Button(action: {print()}){
                                            Image("tricha")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .clipShape(Circle())
                                        }
                                    }
            )
        }
        .accentColor(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct keranjangView: View {
    
    @Binding var jumlah: Int
    
    var body: some View {
        ZStack{
            Button(action: {print()}){
                Image(systemName: "cart")
                    .frame(width: 30, height: 30)
            }
            if jumlah == 0 {
                
            } else {
                if jumlah >= 10 {
                    Text("\(jumlah)")
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                        .padding(5)
                        .background(Color.red)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .offset(x: 10, y: -10)
                } else {
                    Text("\(jumlah)")
                        .foregroundColor(.white)
                        .frame(width: 10, height: 10)
                        .font(.body)
                        .padding(5)
                        .background(Color.red)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .offset(x: 10, y: -10)
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product: View {
    
    let data: ProductModel
    @Binding var jumlahProduct: Int
    
    var body: some View {
        VStack(alignment: .leading){
            // Foto product
            ZStack(alignment: .topTrailing){
                Image(self.data.productPhoto)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height: 200)
                    .clipped()
                
                Button(action: {print("Berhasil tambah ke wishlist")}){
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(.red)
                }
            }
            Text(self.data.productName)
                .font(.title)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            Text("Rp. \(self.data.productPrice)")
                .font(.title)
                .bold()
                .foregroundColor(.red)
                .padding(.leading)
                .padding(.trailing)
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.productLocation)
            }
            .padding(.leading)
            .padding(.trailing)
            HStack{
                HStack{
                    if self.data.ratingCount == 1{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                    else if self.data.ratingCount == 2{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                    else if self.data.ratingCount == 3{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                    else if self.data.ratingCount == 4{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                    else {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                Text("\(self.data.ratingSum) Penilaian")
            }
            .padding(.leading)
            .padding(.trailing)
            
            tambahKeranjang(jumlah: $jumlahProduct)
        }
        .background(Color("abuabu"))
        .cornerRadius(15)
    }
}

struct tambahKeranjang: View {
    
    @Binding var jumlah: Int
    
    var body: some View{
        Button(action: {self.jumlah += 1}){
            HStack{
                Spacer()
                HStack{
                    Image(systemName: "cart")
                    Text("Tambah Ke Keranjang")
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.green)
        .foregroundColor(.white)
        .cornerRadius(15)
        .padding()
    }
    
}
