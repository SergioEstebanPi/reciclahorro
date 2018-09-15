import { Component, OnInit } from '@angular/core';

import { OfertasService } from './../services/ofertas.service';

@Component({
  selector: 'app-traer-ofertas',
  templateUrl: './traer-ofertas.component.html',
  styleUrls: ['./traer-ofertas.component.css']
})
export class TraerOfertasComponent implements OnInit {

  ofertas:Array<any>;

  constructor(private _ofertas:OfertasService) {
    this.ofertas = [{
  		//id: "",
  		titulo: "",
  		descripcion: ""
  	}];
  }

  ngOnInit() {
    this.traerOfertas();
  }

  traerOfertas(){
  	this._ofertas.traerOfertas()
  		.subscribe(
  			respuesta => {
  				//console.log(respuesta);
  				this.ofertas = respuesta;
  			},
  			error => {
  				console.log(error);
  			}
  		);
  }

  mostrarOferta(id){
  	this._ofertas.mostrarOferta(id)
  		.subscribe(
  			respuesta => {
  				console.log(respuesta);
  				//this.traerOfertas();
  			},
  			error => {
  				console.log();
  			}
  		);
  }

  crearOferta(oferta){
  	this._ofertas.crearOferta(oferta)
  		.subscribe(
  			respuesta => {
  				console.log(respuesta);
  				//this.traerofertas();
  			},
  			error => {
  				console.log();
  			}
  		);
  }

  eliminaOferta(id){
  	let confirmacion = confirm("Estas seguro?");
  	if(confirmacion){
	  	this._ofertas.eliminarOferta(id)
	  		.subscribe(
	  			respuesta => {
	  				//console.log(respuesta);
	  				this.traerOfertas();
	  			},
	  			error => {
	  				console.log();
	  			}
	  		);
  	}
  }

}