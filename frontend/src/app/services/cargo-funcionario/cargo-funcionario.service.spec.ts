import { TestBed } from '@angular/core/testing';

import { CargoFuncionarioService } from './cargo-funcionario.service';

describe('CargoFuncionarioService', () => {
  let service: CargoFuncionarioService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CargoFuncionarioService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
