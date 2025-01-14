import { TestBed } from '@angular/core/testing';
import { TiposLoginService } from './tipos-login.service';


describe('TiposloginService', () => {
  let service: TiposLoginService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TiposLoginService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
