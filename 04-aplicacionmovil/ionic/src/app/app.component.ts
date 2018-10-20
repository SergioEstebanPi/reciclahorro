import { Component, ViewChild } from '@angular/core';
import { Nav, Platform, App, NavController } from 'ionic-angular';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

import { HomePage } from '../pages/home/home';
import { ListPage } from '../pages/list/list';
import { DescuentosPage } from '../pages/descuentos/descuentos';
import { SolicitudesPage } from '../pages/solicitudes/solicitudes';
import { OfertasPage } from '../pages/ofertas/ofertas';
import { TraerProductosPage } from '../pages/traer-productos/traer-productos';
import { IniciarSesionPage } from '../pages/iniciar-sesion/iniciar-sesion';

import { Events } from 'ionic-angular';

@Component({
  templateUrl: 'app.html'
})
export class MyApp {
  @ViewChild(Nav) nav: Nav;

  rootPage: any = IniciarSesionPage;

  pages: Array<{title: string, component: any}>;

  usuario:any;
  email:string;

  constructor(public platform: Platform, public statusBar: StatusBar, public splashScreen: SplashScreen,
    public events: Events,
    private appCtrl: App) {
    this.initializeApp();

    events.subscribe('usuario:created', (usuario, time) => {
      // usuario and time are the same arguments passed in `events.publish(usuario, time)`
      console.log('Bienvenido', usuario.email, 'a las', time);
    });

    // used for an example of ngFor and navigation
    this.pages = [
      { title: 'Iniciar sesion', component: IniciarSesionPage }
    ];
    /*
    this.pages = [
      { title: 'Inicio', component: HomePage },
      { title: 'Ofertas', component: OfertasPage },
      { title: 'Productos', component: TraerProductosPage },
      { title: 'List', component: ListPage },
      { title: 'Descuentos', component: DescuentosPage },
      { title: 'Solicitudes', component: SolicitudesPage },
      { title: 'Iniciar sesion', component: IniciarSesionPage }
    ];
    */

  }


  initializeApp() {
    this.platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      this.statusBar.styleDefault();
      this.splashScreen.hide();
    });
  }

  openPage(page) {
    // Reset the content nav to have just this page
    // we wouldn't want the back button to show in this scenario
    this.nav.setRoot(page.component);
  }
}
