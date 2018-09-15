import { Injectable } from '@angular/core';

import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuariosService {

  private url:string;
  private encabezados:any;
  
  constructor(private http:HttpClient) {
  	this.url="http://reciclahorro-api.herokuapp.com";
  	this.encabezados={
  		headers: new HttpHeaders(
	  		{
	  			"Content-Type": "application/json"
	  		}
  		)
  	};
  }

  iniciarSesion(autenticacion):Observable<any>{
  	let urlAutenticacion = this.url + "/user_token";
  	let parametros = JSON.stringify(autenticacion);
  	return this.http.post<any>(
  		urlAutenticacion, 
  		parametros, 
  		this.encabezados
  	);
  }

  crearCuenta(usuario):Observable<any>{
  	let urlCrearCuenta = this.url + "/users";
  	let parametros = JSON.stringify(usuario);
  	return this.http.post<any>(
  		urlCrearCuenta,
  		parametros,
  		this.encabezados
  	);
  }
}
