/* tslint:disable:no-unused-variable */

import { inject, TestBed } from '@angular/core/testing';
import { ProdutoService } from './produto.service';

describe('Service: Produto', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ProdutoService]
    });
  });

  it('should ...', inject([ProdutoService], (service: ProdutoService) => {
    expect(service).toBeTruthy();
  }));
});
