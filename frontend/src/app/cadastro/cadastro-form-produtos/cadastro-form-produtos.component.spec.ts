import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroFormProdutosComponent } from './cadastro-form-produtos.component';

describe('CadastroFormProdutosComponent', () => {
  let component: CadastroFormProdutosComponent;
  let fixture: ComponentFixture<CadastroFormProdutosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CadastroFormProdutosComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroFormProdutosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
