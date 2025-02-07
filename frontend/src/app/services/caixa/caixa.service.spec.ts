/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { CaixaService } from './caixa.service';

describe('Service: Caixa', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [CaixaService]
    });
  });

  it('should ...', inject([CaixaService], (service: CaixaService) => {
    expect(service).toBeTruthy();
  }));
});
