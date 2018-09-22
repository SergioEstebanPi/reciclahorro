import { Injectable } from '@angular/core';

import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { BehaviorSubject } from 'rxjs';

@Injectable({
	providedIn: 'root'
})
export class UsuariosService {

	private url: string;
	private encabezados: any;
	private encabezadosToken: any;
	public usuario: BehaviorSubject<Object> = new BehaviorSubject<Object>(false);

	constructor(private http: HttpClient,
		private _router: Router) {
		this.url = "http://reciclahorro-api.herokuapp.com";
		this.encabezadosToken = {
			headers: new HttpHeaders(
				{
					"Content-Type": "application/json",
					"Authorization": "Bearer " + localStorage.getItem("SessionToken")
				}
			)
		};
		this.encabezados = {
			headers: new HttpHeaders(
				{
					"Content-Type": "application/json"
				}

			)
		};

	}

	obtenerToken(autenticacion): Observable<any> {
		let urlAutenticacion = this.url + "/user_token";
		let parametros = JSON.stringify(autenticacion);
		return this.http.post<any>(
			urlAutenticacion,
			parametros,
			this.encabezados
		);
	}


	iniciarSesion(formulario) {
		this.obtenerToken(formulario)
			.subscribe(
				respuesta => {
					localStorage.setItem("SessionToken", respuesta.jwt);
					console.log("token creado");
				},
				error => {
					console.log(error);
				}
			);
		this.usuarioActual().subscribe(
			usuario => {
				this.usuario = usuario;
				console.log("usuario " + usuario);
				console.log("this.usuario " + this.usuario);
				this._router.navigate(['/']);
			},
			error => {
				console.log(error);
			}
		);
	}

	crearCuenta(usuario): Observable<any> {
		let urlCrearCuenta = this.url + "/users";
		let parametros = JSON.stringify(usuario);
		return this.http.post<any>(
			urlCrearCuenta,
			parametros,
			this.encabezados
		);
	}

	usuarioActual(): Observable<any> {
		let urlUsuario = this.url + "/users/current";
		console.log("este es el token " + localStorage.getItem("SessionToken"));
		return this.http.get<any>(
			urlUsuario,
			localStorage.getItem("SessionToken") ?
				this.encabezadosToken : this.encabezados
		);
	}
}
