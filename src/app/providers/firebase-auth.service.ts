import { Injectable } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/auth';
import { ERR_PLUGIN_NOT_INSTALLED } from '@ionic-native/core/decorators/common';
import 'firebase/auth';

@Injectable({
  providedIn: 'root'
})
export class FirebaseAuthService {

  constructor(private angularFireAuth: AngularFireAuth) { }

  async registerWithEmailPassword(email, password) {
    try {
      const result = await this.angularFireAuth.createUserWithEmailAndPassword(email, password);
      (await this.angularFireAuth.currentUser).sendEmailVerification();
      return result;
    } catch (error) {
      throw new Error(error);
    }
  }
  async loginWithEmailPassword(email, password) {
    try {
      const result = await this.angularFireAuth.signInWithEmailAndPassword(email, password);
      return result;
    } catch (error) {
      throw new Error(error);
    }
  }

  logout() {
    try {
      this.angularFireAuth.signOut();
    } catch (error) {
      throw new Error(error);
    }
  }
  getAuthState() {
    return this.angularFireAuth.authState;
  }
  
  googleLoginWeb(){
    this.angularFireAuth.signInWithRedirect(new GoogleAuthProvider)
  }
}
