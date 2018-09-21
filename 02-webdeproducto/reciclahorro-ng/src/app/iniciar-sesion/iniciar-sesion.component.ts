import { Component, OnInit } from '@angular/core';

import { UsuariosService } from '../services/usuarios.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.css']
})
export class IniciarSesionComponent implements OnInit {

	formulario:any;
	error:boolean;

  constructor(private _usuarios:UsuariosService,
  	          private router:Router) {
  	this.formulario = {
      auth:{
        email: "",
        pasword: ""
      }
    };
    this.error = false;
  }

  ngOnInit() {
  }

  iniciarSesion(formulario){
  	//console.log(this.formulario);
  	this._usuarios
  		.iniciarSesion(this.formulario)
  		.subscribe(
  			respuesta => {
  				//console.log(respuesta);
  				localStorage.setItem("SessionToken", respuesta.jwt);
  				this.router.navigate(['/']);
  				this.error = false;
  			},
  			error => {
  				console.log(error);
  				this.error = true;
  			}
  		);
  }

}
