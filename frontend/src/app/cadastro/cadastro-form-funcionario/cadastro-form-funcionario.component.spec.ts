import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroFormFuncionarioComponent } from './cadastro-form-funcionario.component';

describe('CadastroFormFuncionarioComponent', () => {
  let component: CadastroFormFuncionarioComponent;
  let fixture: ComponentFixture<CadastroFormFuncionarioComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CadastroFormFuncionarioComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroFormFuncionarioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
