import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroFormOrdemservicoComponent } from './cadastro-form-ordemservico.component';

describe('CadastroFormOrdemservicoComponent', () => {
  let component: CadastroFormOrdemservicoComponent;
  let fixture: ComponentFixture<CadastroFormOrdemservicoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CadastroFormOrdemservicoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroFormOrdemservicoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
