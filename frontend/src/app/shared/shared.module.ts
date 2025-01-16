import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';

import { AppMaterialModule } from './app-material/app-material.module';
import { LoadingComponent } from './components/loading/loading.component';
import {MatDialogModule} from '@angular/material/dialog';
import { ErrorDialogComponent } from './components/error-dialog/error-dialog.component';
import { SuccessDialogComponent } from './components/success-dialog/success-dialog/success-dialog.component';
import { Error404Component } from './error404/error404/error404.component';





@NgModule({
  declarations: [
    LoadingComponent,
    ErrorDialogComponent,
    SuccessDialogComponent,
    Error404Component

  ],
  imports: [
    CommonModule,
    AppMaterialModule,
    MatDialogModule,
  ],
  exports: [LoadingComponent, ErrorDialogComponent]
})
export class SharedModule { }
