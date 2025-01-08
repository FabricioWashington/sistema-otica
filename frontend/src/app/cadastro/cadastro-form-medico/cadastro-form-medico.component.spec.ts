import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroFormMedicoComponent } from './cadastro-form-medico.component';

describe('CadastroFormMedicoComponent', () => {
  let component: CadastroFormMedicoComponent;
  let fixture: ComponentFixture<CadastroFormMedicoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CadastroFormMedicoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroFormMedicoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
