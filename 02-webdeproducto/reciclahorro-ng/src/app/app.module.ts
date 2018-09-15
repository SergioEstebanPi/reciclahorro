import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { InicioComponent } from './inicio/inicio.component';

import { RouterModule, Routes} from '@angular/router';
import { CabeceraComponent } from './cabecera/cabecera.component';
import { PiedepaginaComponent } from './piedepagina/piedepagina.component';
import { CrearCuentaComponent } from './crear-cuenta/crear-cuenta.component';
import { IniciarSesionComponent } from './iniciar-sesion/iniciar-sesion.component';
import { TraerOfertasComponent } from './traer-ofertas/traer-ofertas.component';

import { FormsModule } from '@angular/forms';
import { UsuariosService } from './services/usuarios.service';
import { HttpModule } from '@angular/http';
import { HttpClientModule } from '@angular/common/http';

const rutas:Routes=[
  {path:"", component:InicioComponent},
  {path:"inicio", component:InicioComponent},
  {path:"iniciar_sesion", component:IniciarSesionComponent},
  {path:"crear_cuenta", component:CrearCuentaComponent},
  {path:"traer-ofertas", component:TraerOfertasComponent},
  {path:"*", redirectTo:'/', pathMatch:'full'}
];

@NgModule({
  declarations: [
    AppComponent,
    InicioComponent,
    CabeceraComponent,
    PiedepaginaComponent,
    CrearCuentaComponent,
    IniciarSesionComponent,
    TraerOfertasComponent
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(rutas),
    HttpModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [
    UsuariosService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
