import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { ProductosProvider } from '../../providers/productos/productos';
import  { Globals } from '../../globals';

/**
 * Generated class for the TraerProductosPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-traer-productos',
  templateUrl: 'traer-productos.html',
})
export class TraerProductosPage {

 productos:Array<any>;
  frase:string;
  url:string;
  imgdefault:string;

  constructor(public navCtrl: NavController, public navParams: NavParams,
  	private _productos:ProductosProvider,
    private _globals:Globals) {
  	    this.productos = [];
    this.url = this._globals.url;
    this.imgdefault = this._globals.imgdefault;
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad TraerProductosPage');
  }

  ngOnInit() {
    this.traerProductos();
  }


  onKey(event:any){
    this.frase = event.target.value;
    //console.log(this.frase);
    /*
    if (this.frase && this.frase.trim() != '') {
      this.ofertas = this.ofertas.filter(
        (item) => {
          return (item.titulo.toLowerCase().indexOf(this.frase.toLowerCase()) > -1);
        }
      );
      //console.log(this.ofertas);
    } else {
      this.traerOfertas();
    }
    */
    this.traerProductos();

  }    


  traerProductos(){
  	this._productos.traerProductos()
  		.subscribe(
  			respuesta => {
  				//console.log(respuesta);
          //this.productos = respuesta;
          if (this.frase && this.frase.trim() != '') {
            this.productos = this.productos.filter(
              (item) => {
                return (item.nombre.toLowerCase().indexOf(this.frase.toLowerCase()) > -1);
              }
            );
          } else {
            this.productos = respuesta;
          }
  				//this.productos = respuesta;
  			},
  			error => {
  				console.log(error);
  			}
  		);
  }

  mostrarProducto(id){
  	this._productos.mostrarProducto(id)
  		.subscribe(
  			respuesta => {
  				console.log(respuesta);
  				//this.traerProductos();
  			},
  			error => {
  				console.log();
  			}
  		);
  }

  eliminarProducto(id){
  	let confirmacion = confirm("Estas seguro?");
  	if(confirmacion){
	  	this._productos.eliminarProducto(id)
	  		.subscribe(
	  			respuesta => {
	  				//console.log(respuesta);
	  				this.traerProductos();
	  			},
	  			error => {
	  				console.log();
	  			}
	  		);
  	}
  }

}
