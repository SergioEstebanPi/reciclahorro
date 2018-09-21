import { Component, OnInit } from '@angular/core';

import { UsuariosService } from '../services/usuarios.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cabecera',
  templateUrl: './cabecera.component.html',
  styleUrls: ['./cabecera.component.css']
})
export class CabeceraComponent implements OnInit {

  autenticado:boolean;

  constructor(private _usuarios:UsuariosService,
              private router:Router) {
    this.autenticado = false;
  }

  ngOnInit() {
    this.usuarioAutenticado();
  }

  usuarioAutenticado(){
		if (localStorage.getItem("SessionToken")){
      this.autenticado = true;
    } else {
      this.autenticado = false;
    }
  }

  cerrarSesion(){
    localStorage.removeItem('SessionToken');
    this.router.navigate(['/']);
  }
}
