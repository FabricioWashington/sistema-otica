import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TodoListGenericComponent } from './todo-list-generic.component';

describe('TodoListGenericComponent', () => {
  let component: TodoListGenericComponent;
  let fixture: ComponentFixture<TodoListGenericComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [TodoListGenericComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TodoListGenericComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
