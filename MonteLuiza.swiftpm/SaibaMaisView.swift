import SwiftUI

struct SaibaMaisView: View {

    let columns = [GridItem(.adaptive(minimum: 600))]
    let itemModel = ItemModel()
    
    var body: some View {
        ZStack{
            ScrollView {
                
                VStack{
                    Text("O que são os itens do jogo?")
                        .font(.custom("onest", size: 40, relativeTo: .body))
                        .fontWeight(.bold) // Ou .light, .medium, .semibold, etc.))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.pink)
                        .padding(.top, 40)
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    
                    ForEach(itemModel.itens) { item in
                        VStack {
                            Image(item.imagem)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(10)
                            Text(item.descricao)
                                .font(.custom("onest", size: 20, relativeTo: .body))
                                .fontWeight(.medium) // Ou .light, .medium, .semibold, etc.))
                            //.multilineTextAlignment(.center)
                                .foregroundColor(.pink)
                                .padding(.top, 20)
                        }
                        .padding()
                        .background(Color(.white).opacity(0.5))
                        .cornerRadius(16)
                        .frame(width: 400, height: 470)
                        //.shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("fundo5")
                .resizable()
                .scaledToFill()
        )
            .navigationTitle("Descubra mais...")
    }
    
}

#Preview{
    SaibaMaisView()
}
