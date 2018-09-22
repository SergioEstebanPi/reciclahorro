import { Component, OnInit } from '@angular/core';


import { Router } from '@angular/router';
import { UsuariosService } from '../services/usuarios.service';

@Component({
	selector: 'app-iniciar-sesion',
	templateUrl: './iniciar-sesion.component.html',
	styleUrls: ['./iniciar-sesion.component.css']
})
export class IniciarSesionComponent implements OnInit {

	formulario: any;

	constructor(private _usuarios: UsuariosService,
		private _router: Router) {
		this.formulario = {
			auth: {
				email: "",
				pasword: ""
			}
		};
	}

	ngOnInit() {
	}

	iniciarSesion() {
		this._usuarios.iniciarSesion(this.formulario);
	}
}
