import SwiftUI
import UIKit

struct HomeView: View{
    var body: some View{
        //let verde = UIColor(hexString: "#33673B")
        
        NavigationStack{
            ZStack{
                Image("fundo5")
                    .resizable()
                    .scaledToFill()
                VStack{
                    
                    //Link para o jogo principal
                    Image("logotest")
                        .resizable()
                        .scaledToFill()
                        .padding(.top, 80)
                        .frame(width: 700, height: 900)
                    NavigationLink { 
                        ContentView()
                    } label: {
                        HStack(spacing: 16){
                        Image(systemName: "play.fill")
                                .font(.system(size: 40))
                            .foregroundColor(.white)
                        Text("Play")
                            .font(.custom("onest", size: 40, relativeTo: .body))
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                        //                        Image("Home image")
                        //                            .resizable()
                        //                            .scaledToFill()
                        //                            .padding(.top, 80)
                        //                            .frame(width: 700, height: 900)
                        } //.background(Color(.verde))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 16)
                        .background(Color(red: 0.2, green: 0.4, blue: 0.23))
                        .cornerRadius(16)
                    }
                    //instrucoes do jogo
                    Text("Como jogar: clique na tela e coloque os itens dentro da cabeça da Luiza!")
                        .frame(width: 600)
                        .font(.custom("onest", size: 30, relativeTo: .body))
                        .fontWeight(.bold) // Ou .light, .medium, .semibold, etc.))
                        .multilineTextAlignment(.center) // Alinhamento horizontal
                        .padding(.top, 40)
                        .foregroundColor(.pink)
                    
                    // Novo botão "Saiba mais"
                    NavigationLink {
                        SaibaMaisView()
                    } label: {
                        HStack {
                            Image(systemName: "eyes.inverse")
                                .foregroundColor(.pink)
                                .font(.system(size: 20)) // aumenta ou diminui o tamanho
                                .padding(.top, 5)
                            Text("Descubra mais...")
                                .font(.custom("onest", size: 20, relativeTo: .body))
                                .fontWeight(.regular) // Ou .light, .medium, .semibold, etc.))
                                .padding(.top, 5)
                                .foregroundColor(.pink)
                                .opacity(0.8)
                        }
                        //.padding(.top, 10)
                        //.padding(.horizontal, 20)
                        //.padding(.bottom, 10)
                        //.background(Color.pink.opacity(0.2))
                        //.cornerRadius(12)
                    }
                }
            }
        }
    }
}
