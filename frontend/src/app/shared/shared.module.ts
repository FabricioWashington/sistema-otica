import { CommonModule } from '@angular/common';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';

import { AppMaterialModule } from './app-material/app-material.module';
import { LoadingComponent } from './components/loading/loading.component';
import { MatDialogModule } from '@angular/material/dialog';
import { ErrorDialogComponent } from './components/error-dialog/error-dialog.component';
import { SuccessDialogComponent } from './components/success-dialog/success-dialog/success-dialog.component';
import { Error404Component } from './error404/error404/error404.component';
import { ModalFormGenericComponent } from './utils/modal/modal-form-generic/modal-form-generic.component';
import { TodoListGenericComponent } from './utils/todo-list/todo-list-generic/todo-list-generic.component';





@NgModule({
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  declarations: [
    LoadingComponent,
    ErrorDialogComponent,
    SuccessDialogComponent,
    Error404Component,
    ModalFormGenericComponent,
    TodoListGenericComponent,

  ],
  imports: [
    CommonModule,
    AppMaterialModule,
    MatDialogModule,
  ],
  exports: [LoadingComponent, ErrorDialogComponent, ModalFormGenericComponent, TodoListGenericComponent]
})
export class SharedModule { }
