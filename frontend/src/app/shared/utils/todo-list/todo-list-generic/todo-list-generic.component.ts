import { Component, Input } from '@angular/core';

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
  newItem: any = {};
  isLoading = true;

  constructor() {
    this.loading();
  }

  removeItem(index: number) {
    this.data.splice(index, 1);
  }

  editItem(index: number) {
    const itemEditado = this.data[index];
    console.log('Editando:', itemEditado);
    this.newItem = { ...itemEditado };
  }

  loading() {
    setTimeout(() => {
      this.isLoading = false;
    }, 1500);
  }
}
