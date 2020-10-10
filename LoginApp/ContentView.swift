//
//  ContentView.swift
//  LoginApp
//
//  Created by Willi Ismail Munggaran on 10/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var auth : Auth
    
    var body: some View {
        if !auth.isLoggedin{
            return AnyView(Login())
        } else {
            return AnyView(Home())
        }
    }
}

struct Login: View {
    
    @EnvironmentObject var auth : Auth
    
    @State var username: String = ""
    @State var password: String = ""
    
    func loginCheck(){
        if(username == "Admin" && password == "123"){
            auth.isLoggedin = true
        } else {
            auth.isLoggedin = false
            auth.isCorrect = false
        }
    }
    
    var textIsValid: Bool {
        return !username.isEmpty && !password.isEmpty
    }

    var buttonColor: Color {
        return textIsValid ? .accentColor : Color("darkblue").opacity(0.5)
    }
    
    var textColor: Color {
        return textIsValid ? Color(.white) : Color("darkwhite")
    }
    
    var body: some View {
        ZStack{
            Color("putih")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                HStack{
                    HStack{
                        VStack{
                            Text("Hi!")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                            Text("Welcome back!")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.white)
                        }
                        
                        Spacer()
                        
                        Image("bitmap")
                            .resizable()
                            .frame(width: 120, height: 80)
                            .padding()
                    }
                    Spacer()
                }
                .frame(height: 180)
                .padding(30)
                .background(Color.blue)
                .clipShape(customShape(corner: .bottomRight, radii: 50))
                .edgesIgnoringSafeArea(.top)
                
                //form field
                VStack(alignment: .leading){
                    Text("Username").foregroundColor(Color("item"))
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color("grey"))
                        .cornerRadius(5.0)
                        .foregroundColor(Color("item"))
                    
                    Text("Password").foregroundColor(Color("item"))
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color("grey"))
                        .cornerRadius(5.0)
                        .foregroundColor(Color("item"))
                    
                    //notification
                    if(!auth.isCorrect){
                        Text("Please insert correct Username & Password")
                            .foregroundColor(Color.red)
                    }
                    
                    HStack{
                        Button(action:{}){
                            Text("Forgot Password?")
                        }
                        Spacer()
                    } .padding([.top, .bottom], 10)
                    
                    //signin button
                    HStack{
                        Spacer()
                        Button(action: {
                            self.loginCheck()
                        }, label: {
                            Text("Sign In")
                                .bold()
                                .font(.callout)
                                .foregroundColor(textColor)
                        }).disabled(!textIsValid)
                        Spacer()
                    }
                    .padding()
                    .background(buttonColor)
                    .cornerRadius(15)
                    
                    HStack(spacing: 10){
                        Spacer()
                        Text("Don't have an account?")
                            .font(.callout)
                            .foregroundColor(Color("item"))
                        Button(action:{}){
                            Text("Sign Up")
                                .bold()
                                .font(.callout)
                                .foregroundColor(Color.blue)
                        }
                        Spacer()
                    }
                    .padding()
                    
                    //privacy
                    HStack{
                        Spacer()
                        Button(action:{}){
                            Text("Our Privacy")
                                .font(.callout)
                                .foregroundColor(Color.blue)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

//custom shape
struct customShape: Shape {
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        return Path(path.cgPath)
    }
}

struct keranjangView: View {
    
    //    @Binding var jumlah: Int
    @ObservedObject var jumlahkeranjang: GlobalObject
    
    var body: some View {
        ZStack{
            Button(action: {print()}){
                Image(systemName: "cart")
                    .frame(width: 30, height: 30)
            }
            if self.jumlahkeranjang.jumlah == 0 {
                
            } else {
                if self.jumlahkeranjang.jumlah >= 10 {
                    Text("\(self.jumlahkeranjang.jumlah)").bold()
                        .foregroundColor(.white)
                        .frame(width: 10, height: 10)
                        .font(.system(size: 7))
                        .padding(5)
                        .background(Color.red)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .offset(x: 10, y: -10)
                } else {
                    Text("\(self.jumlahkeranjang.jumlah)")
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
    
    let data: DataModel
    //    @Binding var jumlahProduct: Int
    @ObservedObject var jumlahkeranjang: GlobalObject
    @State var isTapped = false
    
    var body: some View {
        VStack(alignment: .leading){
            // Foto product
            ZStack(alignment: .topTrailing){
                Image(self.data.productPhoto)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height: 200)
                    .clipped()
                
                if (!self.isTapped){
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                        .foregroundColor(.red)
                        .onTapGesture {
                            if (!self.isTapped){
                                self.isTapped = true
                                print("Berhasil ditambah ke wishlist")
                            } else {
                                self.isTapped = false
                                print("Berhasil menghapus wishlist")
                            }
                        }
                } else {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                        .foregroundColor(.red)
                        .onTapGesture {
                            if (!self.isTapped){
                                self.isTapped = true
                                print("Berhasil ditambah ke wishlist")
                            } else {
                                self.isTapped = false
                                print("Berhasil menghapus wishlist")
                            }
                        }
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
            
            tambahKeranjang(keranjang: jumlahkeranjang)
        }
        .background(Color("abuabu"))
        .cornerRadius(15)
    }
}

struct tambahKeranjang: View {
    
    //    @Binding var jumlah: Int
    @ObservedObject var keranjang: GlobalObject
    
    var body: some View{
        Button(action: {self.keranjang.jumlah += 1}){
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

struct Home: View {
    
    //Data baru
    let data : [DataModel] = [
        DataModel(id: 1, productName: "Sepatu Bagus", productPhoto: "sneakers1", productPrice: 5500000, productLocation: "Bandung", ratingCount: 4, ratingSum: 48),
        DataModel(id: 2, productName: "Sepatu Edun", productPhoto: "sneakers2", productPrice: 6000000, productLocation: "Bandung", ratingCount: 5, ratingSum: 50),
        DataModel(id: 3, productName: "Sepatu Manjiw", productPhoto: "sneakers3", productPrice: 8000000, productLocation: "Bandung", ratingCount: 4, ratingSum: 66),
        DataModel(id: 4, productName: "Sepatu Icikiwir", productPhoto: "sneakers4", productPrice: 7000000, productLocation: "Bandung", ratingCount: 5, ratingSum: 74),
        DataModel(id: 5, productName: "Sepatu Orang", productPhoto: "sneakers5", productPrice: 6500000, productLocation: "Bandung", ratingCount: 4, ratingSum: 80),
        DataModel(id: 6, productName: "Sepatu Madog", productPhoto: "sneakers6", productPrice: 10000000, productLocation: "Bandung", ratingCount: 4, ratingSum: 99),
        DataModel(id: 7, productName: "Sepatu Buluk", productPhoto: "sneakers7", productPrice: 3000000, productLocation: "Bandung", ratingCount: 5, ratingSum: 121),
        DataModel(id: 8, productName: "Sepatu Anjim", productPhoto: "sneakers8", productPrice: 9000000, productLocation: "Bandung", ratingCount: 4, ratingSum: 18),
        DataModel(id: 9, productName: "Sepatu Bekas", productPhoto: "sneakers9", productPrice: 5100000, productLocation: "Bandung", ratingCount: 4, ratingSum: 6),
        DataModel(id: 10, productName: "Sepatu Saha", productPhoto: "sneakers10", productPrice: 5500000, productLocation: "Bandung", ratingCount: 4, ratingSum: 10)
    ]
    
    //    @State var jumlahKeranjang: Int = 10
    @ObservedObject var globaldata = GlobalObject()
    
    var body: some View {
        //        Product()
        
        NavigationView{
            ScrollView{
                ForEach(data){
                    row in
                    VStack(spacing: 10){
                        Product(data: row, jumlahkeranjang: globaldata)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Product")
            .navigationBarItems(trailing:
                                    HStack(spacing: 20){
                                        
                                        keranjangView(jumlahkeranjang: self.globaldata)
                                        
                                        NavigationLink(destination: User()){
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

struct User: View {
    
    @EnvironmentObject var auth : Auth
    
    var body: some View {
        Button(action: {self.auth.isLoggedin = false}){
            HStack{
                Spacer()
                HStack{
                    Text("LogOut")
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.red)
        .foregroundColor(.white)
        .cornerRadius(15)
        .padding()
    }
}
