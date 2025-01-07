import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroFormEmpresaComponent } from './cadastro-form-empresa.component';

describe('CadastroFormEmpresaComponent', () => {
  let component: CadastroFormEmpresaComponent;
  let fixture: ComponentFixture<CadastroFormEmpresaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CadastroFormEmpresaComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroFormEmpresaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
