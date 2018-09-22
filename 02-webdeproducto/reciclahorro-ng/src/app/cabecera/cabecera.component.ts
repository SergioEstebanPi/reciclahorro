import { Component, OnInit } from '@angular/core';

import { SesionService } from '../services/sesion.service';
import { Router } from '@angular/router';
import { Observable } from '../../../node_modules/rxjs';

import { Input } from '@angular/core';
@Component({
  selector: 'app-cabecera',
  templateUrl: './cabecera.component.html',
  styleUrls: ['./cabecera.component.css']
})
export class CabeceraComponent implements OnInit {
  //autenticado:Observable<boolean>;
  autenticado:boolean;
  usuario:any;

  constructor(private _sesion:SesionService,
              private router:Router) {
  }

  ngOnInit() {
    //this.autenticado = this._sesion.autenticado;
    //this.autenticado.subscribe(
      this._sesion.autenticado.subscribe(
      respuesta => {
        if(respuesta){
          this.autenticado = respuesta;
          this._sesion.usuarioSesion();
          this._sesion.usuario.subscribe(
            respuesta => {
              this.usuario = respuesta;
            },
            error => {
              console.log(error);
            }
          );
        }
      },
      error => {
        console.log(error);
      }
    );
  }

  cerrarSesion(){
    this._sesion.cerrarSesion();
    this.router.navigate(['/']);
  }
}
