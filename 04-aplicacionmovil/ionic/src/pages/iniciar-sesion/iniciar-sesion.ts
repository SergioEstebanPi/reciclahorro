import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, AlertController } from 'ionic-angular';
import { UsuariosProvider } from '../../providers/usuarios/usuarios';
import { HomePage } from '../home/home';

import { Events } from 'ionic-angular';

@IonicPage()
@Component({
  selector: 'page-iniciar-sesion',
  templateUrl: 'iniciar-sesion.html',
})
export class IniciarSesionPage {

	formulario:any;
	logeado:boolean;
	usuario:any;

  	constructor(
  		public navCtrl: NavController, 
  		public navParams: NavParams,
  		private usuarios: UsuariosProvider,
  		public alertCtrl: AlertController,
  		public events: Events) {
  		this.formulario={
  			auth:{
  				email:"",
  				password:""
  			}
  		}
  	}

  	ionViewDidLoad() {
    	console.log('ionViewDidLoad IniciarSesionPage');
  	}

  	iniciarSesion(){
  		this.usuarios.
  			iniciarSesion(this.formulario).
  			subscribe(respuesta=>{
  				localStorage.setItem("SessionToken",respuesta.jwt);
  				let alerta=this.alertCtrl.create({
  					title:"Bienvenido",
  					subTitle: "Inicio de sesión existoso!",
  					buttons: ['Ok']
  				});
  				this.buscarUsuario();
  				this.events.publish('user:created', this.usuario, Date.now());
  				alerta.present();
	          	this.navCtrl.setRoot(HomePage);
	          	this.navCtrl.popToRoot();

  			},error=>{
  				let alertaError=this.alertCtrl.create({
  					title: "Hubo un problema",
  					subTitle: "Porfavor intenta nuevamente",
  					buttons:['Ok']
  				});
  				this.logeado = false;
  				alertaError.present();
  			});
  	}

	  buscarUsuario(){
	    this.usuarios.usuarioActual()
	      .subscribe(
	        respuesta => {
	          this.usuario = respuesta;
	          this.logeado = true;
	          //this.modalRef2 = this._modal.open(NgbdModalContent);
	          //this._router.navigateByUrl('/');
	        },
	        error => {
	          console.log(error);
	        }
	      );
	  }
}