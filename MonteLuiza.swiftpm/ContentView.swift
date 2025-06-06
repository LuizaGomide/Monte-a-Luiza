import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let s = PhysicsScene(size: CGSize(width: 1500, height: 1920))
        s.scaleMode = .aspectFit
        return s
    }
    
    let scale = 1.25 // mexer aqui pra arrumar o tamanho da tela

    var body: some View {
        NavigationStack{
            ZStack(content: {
                SpriteView(scene: scene)
                VStack(content:{
                    Spacer()
                    Image("EuCabeca")
                        .resizable()
                        .frame(width:450*scale, height:480*scale)
                        .opacity(1)
                })
                
            })
            .frame(width: 750*scale, height: 960*scale)
        }
    }
}
