import wollok.game.*
import dino.*



object cactus {
	 
	var position = self.posicionInicial()

	method image() = "cactus.png"
	method position() = position
	
	method posicionInicial() = game.at(game.width()-1,suelo.position().y())

	method iniciar(){
		position = self.posicionInicial()
		game.onTick(velocidad,"moverCactus",{self.mover()})
	}
	
	method mover(){
		if (position.x()==0){
			position = self.posicionInicial()
		}
		else{
			if(self.chocar()){
				self.detener()
			}else{
				position=position.left(1)
			}
		}
		
	}
	
	method chocar()= self.position()==dino.position()
    method detener(){
    	dino.morir()
		game.schedule(2000, { game.stop() })
	}
}//