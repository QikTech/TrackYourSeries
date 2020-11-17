import { Injectable } from '@angular/core';
import { LoadingController, Platform, ToastController } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class WidgetUtilService {

  loading: any = {};

  constructor(private toastController: ToastController, private platform: Platform,
    private loadingController: LoadingController) { }

  async presentToast(message) {
    const toast = await this.toastController.create({
      message,
      duration: 2000,
      // showCloseButton: true,
      position: this.platform.is('desktop') ? 'middle': 'bottom'
    });
    toast.present();
  }
  async presentLoading(){
    this.loading = await this.loadingController.create({
      message: 'Hold on..',
      translucent: true,
    });
    return await this.loading.present();
  }
  async dismissLoader(){
    await this.loading.dismiss();
  }
}
