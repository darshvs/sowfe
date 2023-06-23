import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CandidateDetailsComponent } from './candidate/candidate-details/candidate-details.component';
import { CandidateListComponent } from './candidate/candidate-list/candidate-list.component';
import { SoDetailsComponent } from './so/so-details/so-details.component';
import { SoListComponent } from './so/so-list/so-list.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { LoginComponent } from './login/login.component';
import { TechnologyComponent } from './technology/technology.component';
import { DomainComponent } from './domain/domain.component';
import { CandidateMappingComponent } from './candidate-mapping/candidate-mapping.component';
import { RegistrationComponent } from './registration/registration.component';
import { SecurityComponent } from './shared/Common/security/security.component';
import { ServerDownComponent } from './shared/Common/server-down/server-down.component';
import { ChangePasswordComponent } from './change-password/change-password.component';

const routes: Routes = [
  
  { path: '', redirectTo: 'sow', pathMatch: 'full' },
  
  // {path:'',redirectTo:'/login',pathMatch:'full'},
  {path:'candidatedetails',component:CandidateDetailsComponent},
  {path:'sow',component:SoDetailsComponent},
  {path:'mapping',component:CandidateMappingComponent},
  {path:'domain',component:DomainComponent},
  {path:'technology',component:TechnologyComponent},
  {path:'login',component:LoginComponent},
  {path:'dashboard',component:DashboardComponent},
  {path:'soList',component:SoListComponent},
  {path:'candidateList',component:CandidateListComponent},
  {path:'registration',component:RegistrationComponent},
  {path:'ChangePassword',component:ChangePasswordComponent},
  {path:'server-down',component:ServerDownComponent},
  {path:'securityPage',component:SecurityComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
