import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NfceComponent } from './nfce.component';

describe('NfceComponent', () => {
  let component: NfceComponent;
  let fixture: ComponentFixture<NfceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [NfceComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(NfceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
