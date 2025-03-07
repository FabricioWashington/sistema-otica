import { Component, Inject } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-modal-form-generic',
  standalone: false,

  templateUrl: './modal-form-generic.component.html',
  styleUrl: './modal-form-generic.component.scss'
})
export class ModalFormGenericComponent {
  formData: any = {};

  constructor(
    public dialogRef: MatDialogRef<ModalFormGenericComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) {
    this.data.fields.forEach((field: any) => {
      this.formData[field.name] = field.value || '';
    });
  }

  submit() {
    this.dialogRef.close(this.formData);
  }

  closeModal() {
    this.dialogRef.close();
  }
}
