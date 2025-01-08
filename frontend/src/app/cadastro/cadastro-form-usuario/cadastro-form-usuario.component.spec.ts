import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroFormUsuarioComponent } from './cadastro-form-usuario.component';

describe('CadastroFormUsuarioComponent', () => {
  let component: CadastroFormUsuarioComponent;
  let fixture: ComponentFixture<CadastroFormUsuarioComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CadastroFormUsuarioComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroFormUsuarioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
