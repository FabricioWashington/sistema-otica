import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration, withEventReplay } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AppMaterialModule } from './shared/app-material/app-material.module';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { LoginModule } from './login/login.module';
import { HeaderModule } from './shared/components/header/header.module';
import { HashLocationStrategy, LocationStrategy } from '@angular/common';
import { RouterModule } from '@angular/router';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { SharedModule } from './shared/shared.module';
import { NavModule } from './shared/components/nav/nav.module';
import { LoginEmpresaModule } from './login-empresa/login-empresa.module';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { AuthInterceptor } from './interceptors/auth.interceptor';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    AppMaterialModule,
    LoginModule,
    LoginEmpresaModule,
    HeaderModule,
    NavModule,
    RouterModule.forRoot([]),
    BrowserAnimationsModule,
    SharedModule,
    HttpClientModule
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptor,
      multi: true,
    },
    provideClientHydration(withEventReplay()),
    provideAnimationsAsync(),
    { provide: LocationStrategy, useClass: HashLocationStrategy }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
