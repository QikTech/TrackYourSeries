import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
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
<<<<<<< HEAD
  validationMessage: any = LOGIN
  showLoginSpinner: boolean = false;
  widgetUtilService: any;

  constructor(private helperService: HelperService, private router: Router, private firebaseAuthService: FirebaseAuthService,
    private widjetUtilService: WidgetUtilService) { }
=======
  validationMessage: any = LOGIN 

  constructor(private helperService: HelperService) { }
>>>>>>> parent of 654cccf... Auth Ready Home Begins 19

  ngOnInit() {
    this.createFormControl();
    this.createForm(); 
  }
   
  async loginWithEmailPassword() {
    try {
      this.showLoginSpinner = true;
      const result = await this.firebaseAuthService.loginWithEmailPassword(this.email.value, this.password.value);  
      // console.log('result==', result);
      this.showLoginSpinner = false;
      this.widgetUtilService.presentToast('Login Successful');
      this.loginForm.reset();
      this.router.navigate(['/manager']);
    } catch (error) {
      console.log('Error', error);
      this.showLoginSpinner = false;
      this.widgetUtilService.presentToast(error.message);
    }

  }

  createFormControl(){
    this.email = new FormControl('',[
      Validators.required,
      Validators.email
    ]);
    this.password = new FormControl('',[
      Validators.required,
      Validators.minLength(5)
    ]);
  }

  createForm(){
    this.loginForm = new FormGroup({
      email: this.email,
      password: this.password
    });
    this.loginForm.valueChanges.subscribe(data => this.onFormValueChanged(data));
  }

  onFormValueChanged(data) {
    this.formError = this.helperService.prepareValidationMessage(this.loginForm, this.validationMessage, this.formError);
    // console.log('===formError', this.formError)
  }
}
