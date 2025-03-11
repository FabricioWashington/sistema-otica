import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-todo-list-generic',
  standalone: false,

  templateUrl: './todo-list-generic.component.html',
  styleUrl: './todo-list-generic.component.scss'
})
export class TodoListGenericComponent {
  @Input() columns: { key: string, label: string }[] = [];
  @Input() titulo = "Titulo";
  @Input() data: any[] = [];

  @Output() editEvent = new EventEmitter<any>()
  @Output() deleteEvent = new EventEmitter<any>()

  public newItem: any = {};
  public isLoading = true;

  constructor() {
    this.loading();
  }

  removeItem(index: number) {
    this.deleteEvent.emit(index);
    this.data.splice(index, 1);
  }

  editItem(index: number) {
    const itemEditado = this.data[index];
    console.log('Editando:', itemEditado);
    this.editEvent.emit(this.data[index]);
    this.newItem = { ...itemEditado };
  }

  loading() {
    setTimeout(() => {
      this.isLoading = false;
    }, 1500);
  }
}
