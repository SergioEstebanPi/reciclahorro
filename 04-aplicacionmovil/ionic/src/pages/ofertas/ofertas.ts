import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { OfertasProvider } from '../../providers/ofertas/ofertas';

import { Globals } from '../../globals';

/**
 * Generated class for the OfertasPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-ofertas',
  templateUrl: 'ofertas.html',
})
export class OfertasPage {

  ofertas:Array<any>;
  url:string;

  constructor(public navCtrl: NavController, public navParams: NavParams,
  	public _ofertas:OfertasProvider,
  	public _globals:Globals) {
  		this.ofertas=[];
  		this.url = this._globals.url;
  }

  ionViewDidLoad() {
    //console.log('ionViewDidLoad OfertasPage');
    this._ofertas.
    	traerOfertas().
    	subscribe(respuesta=>{
    		this.ofertas=respuesta;
    	},error=>{
    		console.log(error);
    		// let alerta= this.alertCtrl.create({
    		// 	title:"Error!",
    		// 	subTitle:"No se pudieron obtener los datos",
    		// 	buttons:['Ok']
    		// });

    		// alerta.present();
    	});
  }



}
