import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroFormMarcaComponent } from './cadastro-form-marca.component';

describe('CadastroFormMarcaComponent', () => {
  let component: CadastroFormMarcaComponent;
  let fixture: ComponentFixture<CadastroFormMarcaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CadastroFormMarcaComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroFormMarcaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
