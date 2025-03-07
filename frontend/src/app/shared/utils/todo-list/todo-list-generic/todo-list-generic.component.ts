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
  data: any[] = [];
  newItem: any = {};
  isLoading = true;

  constructor() {
    this.loading();
  }

  addItem() {
    if (Object.keys(this.newItem).length) {
      this.data.push({ ...this.newItem });
      this.newItem = {};
    }
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
