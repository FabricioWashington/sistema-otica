import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VendasPagamentoComponent } from './vendas-pagamento.component';

describe('VendasPagamentoComponent', () => {
  let component: VendasPagamentoComponent;
  let fixture: ComponentFixture<VendasPagamentoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [VendasPagamentoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VendasPagamentoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
