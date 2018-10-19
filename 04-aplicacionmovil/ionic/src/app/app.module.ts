import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { ListPage } from '../pages/list/list';
import { DescuentosPage } from '../pages/descuentos/descuentos';
import { SolicitudesPage } from '../pages/solicitudes/solicitudes';
import { OfertasPage } from '../pages/ofertas/ofertas';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { OfertasProvider } from '../providers/ofertas/ofertas';

import { HttpClientModule } from '@angular/common/http';
import { Globals } from '../globals';

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    ListPage,
    DescuentosPage,
    SolicitudesPage,
    OfertasPage
  ],
  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp),
    HttpClientModule
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    ListPage,
    DescuentosPage,
    SolicitudesPage,
    OfertasPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    OfertasProvider,
    Globals
  ]
})
export class AppModule {}
