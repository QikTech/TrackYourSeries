import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { LOGIN } from '../constants/formValidationMessage';
import { FirebaseAuthService } from '../providers/firebase-auth.service';
import { HelperService } from '../providers/helper.service';
import { WidgetUtilService } from '../providers/widget-util.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  loginForm: FormGroup;
  email: FormControl;
  password: FormControl;
  formError: any = {
    email: '',
    password: ''
  };
  validationMessage: any = LOGIN;
  showLoginSpinner: boolean = false;
  // helperService: any;

  constructor(private helperService: HelperService, private router: Router,
    private firebaseAuthService: FirebaseAuthService, private widgetUtilService: WidgetUtilService) { }

  ngOnInit() {
    this.createFormControl();
    this.createForm();
  }

  async loginWithEmailAndPassword(){
    try {
      this.showLoginSpinner = true;
      const result = await this.firebaseAuthService.loginWithEmailPassword(this.email.value, this.password.value);
      console.log('result',result);
      this.showLoginSpinner = false;
      this.widgetUtilService.presentToast('Login Successful');
      this.resetForm();
      this.router.navigate(['/home']);
    } catch (error) {
      console.log('Error', error);
      this.showLoginSpinner = false;
      this.widgetUtilService.presentToast(error.message);
    }
  }
  resetForm() {
    this.loginForm.reset();
    this.formError = {
      email: '',
      password: ''
    };
  }

  goToSignupPage() {
    this.router.navigate(['/signup']);
  }

  createFormControl() {
    this.email = new FormControl('', [
      Validators.required,
      Validators.email
    ]);

    this.password = new FormControl('',[
      Validators.required,
      Validators.minLength(4)
    ]);
  }

  createForm() {
    this.loginForm = new FormGroup({
      email: this.email,
      password: this.password
    });
    this.loginForm.valueChanges.subscribe(data => this.onFormValueChanged(data));
  }

  onFormValueChanged(data) {
    this.formError = this.helperService.prepareValidationMessage(this.loginForm, this.validationMessage, this.formError);
    console.log('===formError', this.formError);
  }

}
