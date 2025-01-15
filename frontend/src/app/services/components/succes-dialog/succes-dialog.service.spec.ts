import { TestBed } from '@angular/core/testing';

import { SuccesDialogService } from './succes-dialog.service';

describe('SuccesDialogService', () => {
  let service: SuccesDialogService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SuccesDialogService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
