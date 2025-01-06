import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';

import { AppMaterialModule } from './app-material/app-material.module';
import { LoadingComponent } from './components/loading/loading.component';





@NgModule({
  declarations: [

    LoadingComponent
  ],
  imports: [
    CommonModule,
    AppMaterialModule,
  ],
  exports: [LoadingComponent]
})
export class SharedModule { }
