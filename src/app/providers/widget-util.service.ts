import { Injectable } from '@angular/core';
import { Platform, ToastController } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class WidgetUtilService {

  constructor(private toastController: ToastController, private platform: Platform) { }

  async presentToast(message){
    const toast = await this.toastController.create({
      message,
      duration: 1500,
      position: this.platform.is('desktop') ? 'top': 'bottom'
    });
    toast.present();
};
}