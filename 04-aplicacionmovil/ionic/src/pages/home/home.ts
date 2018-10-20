import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

import { ViewChild } from '@angular/core';
import { Slides } from 'ionic-angular';

//import { HomePage } from '../home/home';
import { ListPage } from '../list/list';
import { DescuentosPage } from '../descuentos/descuentos';
import { SolicitudesPage } from '../solicitudes/solicitudes';
import { OfertasPage } from '../ofertas/ofertas';
import { TraerProductosPage } from '../traer-productos/traer-productos';
import { IniciarSesionPage } from '../iniciar-sesion/iniciar-sesion';

import { Nav, Platform } from 'ionic-angular';
@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  @ViewChild(Slides) slides: Slides;
  @ViewChild(Nav) nav: Nav;

  rootPage: any = DescuentosPage;


  pages: Array<{title: string, component: any}>;
  usuario:any;
  email:string;
  
  constructor(public platform: Platform) {
  	this.usuario = {
  		email: "",
  		rol: ""
  	};

  }

  ionViewWillEnter() {
    this.pages = [
      //{ title: 'Inicio', component: HomePage },
      { title: 'Descuentos', component: DescuentosPage },
      { title: 'Solicitudes', component: SolicitudesPage },
      { title: 'Iniciar sesion', component: IniciarSesionPage }
    ];
    /*
    if (this.usuario.rol = '2') {
      this.pages = [
        { title: 'List', component: ListPage },
        { title: 'Productos', component: TraerProductosPage },
      ];
      this.openPage('ListPage');
    } else {
      this.pages = [
        { title: 'Ofertas', component: OfertasPage },
      ];
      this.openPage('HomePage');
    }
    */
    this.email = this.usuario.email;
  }

  goToSlide() {
  	  	this.slides.autoplay = 10;
  	this.slides.startAutoplay();
    this.slides.slideTo(2, 500);
  }

  openPage(page) {
    // Reset the content nav to have just this page
    // we wouldn't want the back button to show in this scenario
    this.nav.setRoot(page.component);
  }

}
