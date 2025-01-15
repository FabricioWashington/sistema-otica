import { Injectable } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { SuccessDialogComponent } from '../../../shared/components/success-dialog/success-dialog/success-dialog.component';

@Injectable({
  providedIn: 'root'
})
export class SuccesDialogService {
 constructor(private dialog: MatDialog) {}

  showErrorDialog(title: string, message: string): void {
    this.dialog.open(SuccessDialogComponent, {
      data: { title, message },
      width: '400px'
    });
  }
}
