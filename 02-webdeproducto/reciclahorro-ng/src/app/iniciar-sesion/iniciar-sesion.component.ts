import { Component, OnInit } from '@angular/core';


import { Router } from '@angular/router';
import { SesionService } from '../services/sesion.service';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.css']
})
export class IniciarSesionComponent implements OnInit {

	formulario:any;
	error:boolean;

  constructor(private _sesion:SesionService,
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

  iniciarSesion(){
		this._sesion.iniciarSesion(this.formulario);
		this.router.navigate(['/']);
		this.error = false;	
  }

}
