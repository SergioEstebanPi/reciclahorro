import { Component, OnInit } from '@angular/core';

import { UsuariosService } from '../services/usuarios.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-crear-cuenta',
  templateUrl: './crear-cuenta.component.html',
  styleUrls: ['./crear-cuenta.component.css']
})
export class CrearCuentaComponent implements OnInit {

  formulario:any;

  constructor(private _usuarios:UsuariosService,
  	          private router:Router) {
    this.formulario = {
      user: {
        name: "",
        email: "",
        password: "",
        password_confirmation: ""
      }
    };
  }

  crearCuenta(){
  	//console.log(this.formulario);
  	this._usuarios
  		.crearCuenta(this.formulario)
  		.subscribe(
  			respuesta => {
  				//console.log(respuesta);
  				let autenticacion = {
  					auth:{
  						email: this.formulario.user.email,
  						password: this.formulario.user.password
  					}
  				};
  				this._usuarios.iniciarSesion(autenticacion)
  					.subscribe(
  						respuesta => {
  							//console.log(respuesta);
  							this.router.navigate(['/']);
  						},
  						error => {
  							console.log(error);
  						}
  					);
  			},
  			error => {
  				console.log(error);
  			}
  		);
  }


  ngOnInit() {
  }

}
