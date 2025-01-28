/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { PessoaFisicaService } from './pessoa-fisica.service';

describe('Service: PessoaFisica', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [PessoaFisicaService]
    });
  });

  it('should ...', inject([PessoaFisicaService], (service: PessoaFisicaService) => {
    expect(service).toBeTruthy();
  }));
});
