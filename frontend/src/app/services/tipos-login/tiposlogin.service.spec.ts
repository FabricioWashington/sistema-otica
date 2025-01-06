import { TestBed } from '@angular/core/testing';

import { TiposloginService } from './tiposlogin.service';

describe('TiposloginService', () => {
  let service: TiposloginService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TiposloginService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
