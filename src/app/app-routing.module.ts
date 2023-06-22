import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CandidateDetailsComponent } from './candidate/candidate-details/candidate-details.component';
import { CandidateListComponent } from './candidate/candidate-list/candidate-list.component';

const routes: Routes = [
  {path:'candidate-details',component:CandidateDetailsComponent},
  {path:'candidate-list',component:CandidateListComponent},
  { path: '', redirectTo: 'candidate-details', pathMatch: 'full' },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
