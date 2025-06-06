import AVFoundation

import SpriteKit

var backgroundMusicPlayer: AVAudioPlayer?
var soundEffectPlayer: AVAudioPlayer?

// Essa é a cena interativa que é exibida
class PhysicsScene: SKScene, SKPhysicsContactDelegate {
    
    // Função fora do método didMove — faz parte da classe
    func playBackgroundMusic(filename: String) {
        if let url = Bundle.main.url(forResource: filename, withExtension: nil) {
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
                backgroundMusicPlayer?.numberOfLoops = -1 // loop infinito
                backgroundMusicPlayer?.volume = 0.3 // volume entre 0.0 e 1.0
                backgroundMusicPlayer?.prepareToPlay()
                backgroundMusicPlayer?.play()
            } catch {
                print("Erro ao carregar a música: \(error)")
            }
        } else {
            print("Arquivo de música não encontrado")
        }
    }
    func playSoundEffect(filename: String) {
        if let url = Bundle.main.url(forResource: filename, withExtension: nil) {
            do {
                soundEffectPlayer = try AVAudioPlayer(contentsOf: url)
                soundEffectPlayer?.volume = 1.0
                soundEffectPlayer?.prepareToPlay()
                soundEffectPlayer?.play()
            } catch {
                print("Erro ao carregar o efeito sonoro: \(error)")
            }
        }
    }


    // Essa parte do código é executada logo que a cena começa
    override func didMove(to view: SKView) {
        
        // Chamar a música logo no início da cena:
        playBackgroundMusic(filename: "Happy Bee - Kevin MacLeod.mp3")
        
        // Adicionando imagem de fundo
        let background = SKSpriteNode(imageNamed: "fundo5")
        background.size = self.size
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -1 // Para ficar atrás de tudo
        
        self.addChild(background)

        // Aproveitamos esse momento para criar paredes para que os objetos não escapem da cena
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        // Define a parede criada como corpo físico da cena
        self.physicsBody = borderBody
        
    
        
        // Cria um retângulo fixo no centro da tela (ou onde quiser)
        let headBottom = SKSpriteNode(color: .red, size: CGSize(width: 630, height: 200))
        
        // Define a posição do retângulo (por exemplo, centro da tela)
        headBottom.position = CGPoint(x: frame.midX, y: 500)
       
        //Deixa a caixa invisivel
        headBottom.alpha = 0.0
        
        // Cria um corpo físico com o mesmo tamanho do retângulo
        let corpoHeadBottom = SKPhysicsBody(rectangleOf: headBottom.size)
        
        // Define o corpo como estático (não se move com gravidade ou colisões)
        corpoHeadBottom.isDynamic = false
        
        // Atribui o corpo físico ao retângulo
        headBottom.physicsBody = corpoHeadBottom
        
        // Adiciona o retângulo à cena
        self.addChild(headBottom)
        
        
        
        // Cria um retângulo fixo no centro da tela (ou onde quiser)
        let headRight = SKSpriteNode(color: .blue, size: CGSize(width: 20, height: 500))
        
        // Define a posição do retângulo (por exemplo, centro da tela)
        headRight.position = CGPoint(x: 1045, y: 700)
        
        //Deixa a caixa invisivel
        headRight.alpha = 0.0
        
        // Cria um corpo físico com o mesmo tamanho do retângulo
        let corpoHeadRight = SKPhysicsBody(rectangleOf: headRight.size)
        
        // Define o corpo como estático (não se move com gravidade ou colisões)
        corpoHeadRight.isDynamic = false
        
        // Atribui o corpo físico ao retângulo
        headRight.physicsBody = corpoHeadRight
        
        // Adiciona o retângulo à cena
        self.addChild(headRight)
        
        
        
        // Cria um retângulo fixo no centro da tela (ou onde quiser)
        let headLeft = SKSpriteNode(color: .green, size: CGSize(width: 20, height: 500))
        
        // Define a posição do retângulo (por exemplo, centro da tela)
        headLeft.position = CGPoint(x: 400, y: 670)
        
        //Deixa a caixa invisivel
        headLeft.alpha = 0.0
        
        // Cria um corpo físico com o mesmo tamanho do retângulo
        let corpoHeadLeft = SKPhysicsBody(rectangleOf: headLeft.size)
        
        // Define o corpo como estático (não se move com gravidade ou colisões)
        corpoHeadLeft.isDynamic = false
        
        // Atribui o corpo físico ao retângulo
        headLeft.physicsBody = corpoHeadLeft
        
        // Adiciona o retângulo à cena
        self.addChild(headLeft)


    }

    // Função que recebe a coordenada do ponto clicado na tela
    func touchDown(atPoint pos : CGPoint) {
        // Cada vez que ocorre um click na tela, chamamos a função para adicionar um novo álbum na cena.
        newAlbum(position: pos)
    }

    // Função chamada para criar um novo álbum na cena
    func newAlbum(position: CGPoint) {

        // Vamos começar sorteando um dos 26 álbuns
        let sort = Int.random(in: 1...13)

        // Então vamos transformar o número em string (texto) para coincidir com o nome dos álbuns que importamos no projeto

        let albumName = String(sort)

        // Vamos criar um SPRITE com a imagem do álbum sorteado
        // Pense nos sprites como imagens mais poderosas. Podemos alterar cor, forma, posição e muitos outros atributos. Além disso, os sprites podem possuir corpos físicos, o que permite que eles sejam afetados pela "gravidades", colidam e interajam com outros elementos
        let album = SKSpriteNode(imageNamed: albumName)

        // Ajustando a escala do álbum
        album.setScale(0.3)

        // Vamos posicionar o sprite na posição clicada na tela. A posição foi recebida pela função newAlbum
        album.position = position

        // Adicionando física ao álbum. Para que ele possa cair e colidir com os demais álbuns na tela

        // Vamos criar o corpo físico com tamanho igual ao da imagem do álbum
        let body = SKPhysicsBody(rectangleOf: album.size)

        // Vamos ligar a gravidade do corpo físico
        body.affectedByGravity = true

        // Agora vamos atribuir o corpo físico ao álbum
        album.physicsBody = body

        // E finalmente o novo álbum é adicionado na cena
        self.addChild(album)

        // Aplicando um impulso aleatório para o álbum ser arremessado quando criado
        body.applyImpulse(CGVector(dx: CGFloat.random(in: -350...350), dy: CGFloat.random(in: 20...300)))
        playSoundEffect(filename: "fun pop2.mp3")
    }



    // Essa parte cuida de monitorar os toques ou cliques na tela. Cada vez que isso acontece essa função chama a nossa outra função touchDown passando a posição exata do toque na tela. Normalmente não precisamos mexer aqui.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
}
