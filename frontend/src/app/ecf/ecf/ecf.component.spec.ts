import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EcfComponent } from './ecf.component';

describe('EcfComponent', () => {
  let component: EcfComponent;
  let fixture: ComponentFixture<EcfComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [EcfComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EcfComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
