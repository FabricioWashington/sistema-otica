import { Injectable } from '@angular/core';
import { Location } from '@angular/common';

@Injectable({
  providedIn: 'root'
})
export class NavigationService {
  isBackDisabled: boolean = true;
  isForwardDisabled: boolean = true;

  constructor(private location: Location) {
    this.checkNavigationState();
  }

  goBack(): void {
    if (!this.isBackDisabled) {
      this.location.back();
      this.checkNavigationState();
    }
  }

  goForward(): void {
    if (!this.isForwardDisabled) {
      this.location.forward();
      this.checkNavigationState();
    }
  }

  checkNavigationState(): void {
    this.isBackDisabled = this.location.isCurrentPathEqualTo('/');
    this.isForwardDisabled = false;
  }
}
