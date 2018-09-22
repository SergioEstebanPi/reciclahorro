import { Injectable } from '@angular/core';

import { UsuariosService } from '../services/usuarios.service';
import { BehaviorSubject } from 'rxjs';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class SesionService {

  public autenticado = new BehaviorSubject<boolean>(false);
  public usuario = new BehaviorSubject<Object>(false);
  

  constructor(private _usuarios:UsuariosService,
              private router:Router) {
    this.autenticado.next(localStorage.getItem("SessionToken")?true:false);
    //this.autenticado.next(true);
  }

  iniciarSesion(formulario){
  	//console.log(this.formulario);
  	this._usuarios
  		.obtenerToken(formulario)
  		.subscribe(
  			respuesta => {
          //console.log(respuesta);
          localStorage.setItem("SessionToken", respuesta.jwt);
          this.autenticado.next(true);
          this.router.navigate(['/']);
  			},
  			error => {
          console.log(error);
          this.autenticado.next(false);
					//this.error = true;
        }
      );
  }

  usuarioSesion(){
    this._usuarios.usuarioActual()
    .subscribe(
      respuesta => {
        this.usuario.next(respuesta);
      },
      error => {
        console.log(error);
      }
    );
  }

  cerrarSesion(){
    localStorage.removeItem('SessionToken');
    this.autenticado.next(false);
  }

}
