import { Injectable } from '@angular/core';
import { LoadingController, Platform, ToastController } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class WidgetUtilService {

  loading: any = {};

  // presentLoading() {
  //   throw new Error('Method not implemented.');
  // }

  constructor(private toastController: ToastController, private platform: Platform,
    private loadingController: LoadingController) { }

  async presentToast(message){
    const toast = await this.toastController.create({
      message,
      duration: 1500,
      position: this.platform.is('desktop') ? 'top': 'bottom'
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