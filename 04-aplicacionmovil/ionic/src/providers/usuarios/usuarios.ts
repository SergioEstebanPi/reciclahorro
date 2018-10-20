import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AlertController } from 'ionic-angular';
import { Observable } from 'rxjs';

import { Globals } from '../../globals';
/*
  Generated class for the UsuariosProvider provider.
  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class UsuariosProvider {

	private url:string;
	private encabezados:any;

  	constructor(
      private http:HttpClient,
      private alertCtrl:AlertController,
      public _globals:Globals
      ) { 
      	this.url = _globals.url;
  		this.encabezados={
  			headers: new HttpHeaders({
  				'Content-Type': 'application/json'
  			})
  		};
  	}

  	iniciarSesion(autenticacion):Observable<any>{
  		let urlAutenticacion=this.url+'user_token';
  		let parametros=JSON.stringify(autenticacion);
  		return this.http.
  			post<any>(urlAutenticacion,parametros,this.encabezados);
  	}

	usuarioActual(): Observable<any> {
		let urlUsuario = this.url + "users/current";
		let encabezadosToken = {
			headers: new HttpHeaders(
				{
					"Content-Type": "application/json",
					"Authorization": "Bearer " + localStorage.getItem("SessionToken")
				}
			)
		};
		return this.http.get<any>(
			urlUsuario,
			encabezadosToken
		);
	}


    crearCuenta(usuario):Observable<any>{
      let urlCrearCuenta=this.url+"users";
      let parametros=JSON.stringify(usuario);
      return this.http.
        post<any>(urlCrearCuenta,parametros,this.encabezados);
    }

    validarSesion():boolean{
      if (localStorage.getItem("SessionToken")) {
        return true;
      }else{
        let alerta=this.alertCtrl.create({
          title:"Necesitas iniciar Sesión",
          subTitle:"",
          buttons:['Ok']
        });

        alerta.present();
        return false;
      } 
    }

}