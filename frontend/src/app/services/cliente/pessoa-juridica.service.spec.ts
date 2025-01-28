/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { PessoaJuridicaService } from './pessoa-juridica.service';

describe('Service: PessoaJuridica', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [PessoaJuridicaService]
    });
  });

  it('should ...', inject([PessoaJuridicaService], (service: PessoaJuridicaService) => {
    expect(service).toBeTruthy();
  }));
});
