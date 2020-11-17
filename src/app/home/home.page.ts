import { Component } from '@angular/core';
import { Router } from '@angular/router';
// import { trace } from 'console';
import { WidgetUtilService } from '../provider/widget-util.service';
import { FirebaseAuthService } from '../providers/firebase-auth.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor(private firebaseAuthService: FirebaseAuthService,
    private widgetUtilService: WidgetUtilService, private router: Router) {}
  async logout(){
    try {
      await this.firebaseAuthService.logout();
      this.widgetUtilService.presentToast('Logout Successfull');
      this.router.navigate(['/login']);
    } catch (error) {
      console.log('Error', error);
      this.widgetUtilService.presentToast(error.message);
    }
  }
}
