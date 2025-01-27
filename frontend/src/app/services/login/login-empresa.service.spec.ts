/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { LoginEmpresaService } from './login-empresa.service';

describe('Service: LoginEmpresa', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [LoginEmpresaService]
    });
  });

  it('should ...', inject([LoginEmpresaService], (service: LoginEmpresaService) => {
    expect(service).toBeTruthy();
  }));
});
