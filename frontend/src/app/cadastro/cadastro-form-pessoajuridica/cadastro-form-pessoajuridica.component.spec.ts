import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroFormPessoajuridicaComponent } from './cadastro-form-pessoajuridica.component';

describe('CadastroFormPessoajuridicaComponent', () => {
  let component: CadastroFormPessoajuridicaComponent;
  let fixture: ComponentFixture<CadastroFormPessoajuridicaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CadastroFormPessoajuridicaComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroFormPessoajuridicaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
