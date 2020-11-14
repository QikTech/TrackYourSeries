import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { LOGIN } from '../constants/formValidationMessage';
import { HelperService } from '../providers/helper.service';

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
  validationMessage: any = LOGIN 

  constructor(private helperService: HelperService) { }

  ngOnInit() {
    this.createFormControl();
    this.createForm(); 
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
