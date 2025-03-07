import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalFormGenericComponent } from './modal-form-generic.component';

describe('ModalFormGenericComponent', () => {
  let component: ModalFormGenericComponent;
  let fixture: ComponentFixture<ModalFormGenericComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ModalFormGenericComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ModalFormGenericComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
