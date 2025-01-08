import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroFormArmacoesComponent } from './cadastro-form-armacoes.component';

describe('CadastroFormArmacoesComponent', () => {
  let component: CadastroFormArmacoesComponent;
  let fixture: ComponentFixture<CadastroFormArmacoesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CadastroFormArmacoesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroFormArmacoesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
