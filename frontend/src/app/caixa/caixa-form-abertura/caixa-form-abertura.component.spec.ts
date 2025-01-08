import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CaixaFormAberturaComponent } from './caixa-form-abertura.component';

describe('CaixaFormAberturaComponent', () => {
  let component: CaixaFormAberturaComponent;
  let fixture: ComponentFixture<CaixaFormAberturaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CaixaFormAberturaComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CaixaFormAberturaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
