import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroFormPessoafisicaComponent } from './cadastro-form-pessoafisica.component';

describe('CadastroFormPessoafisicaComponent', () => {
  let component: CadastroFormPessoafisicaComponent;
  let fixture: ComponentFixture<CadastroFormPessoafisicaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CadastroFormPessoafisicaComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroFormPessoafisicaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
