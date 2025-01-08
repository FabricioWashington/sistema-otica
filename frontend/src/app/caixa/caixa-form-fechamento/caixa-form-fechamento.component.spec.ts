import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CaixaFormFechamentoComponent } from './caixa-form-fechamento.component';

describe('CaixaFormFechamentoComponent', () => {
  let component: CaixaFormFechamentoComponent;
  let fixture: ComponentFixture<CaixaFormFechamentoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CaixaFormFechamentoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CaixaFormFechamentoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
