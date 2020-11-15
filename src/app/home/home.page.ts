import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { FirebaseAuthService } from '../providers/firebase-auth.service';
import { WidgetUtilService } from '../providers/widget-util.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.page.html',
  styleUrls: ['./home.page.scss'],
})
export class HomePage {

  constructor(private firebaseAuthService: FirebaseAuthService, private widgetUtilService: WidgetUtilService,
    private router: Router) { }

    async logout() {
      try {
        await this.firebaseAuthService.logout();
        this.widgetUtilService.presentToast('Logout Success');
        this.router.navigate(['/login']);
      } catch (error) {
        console.log('Error', error);
        this.widgetUtilService.presentToast(error.message);
      }
      
    }

}
