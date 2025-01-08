import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VendasBalcaoComponent } from './vendas-balcao.component';

describe('VendasBalcaoComponent', () => {
  let component: VendasBalcaoComponent;
  let fixture: ComponentFixture<VendasBalcaoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [VendasBalcaoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VendasBalcaoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
