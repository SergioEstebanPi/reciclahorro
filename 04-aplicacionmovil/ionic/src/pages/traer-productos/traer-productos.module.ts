import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { TraerProductosPage } from './traer-productos';

@NgModule({
  declarations: [
    TraerProductosPage,
  ],
  imports: [
    IonicPageModule.forChild(TraerProductosPage),
  ],
})
export class TraerProductosPageModule {}
