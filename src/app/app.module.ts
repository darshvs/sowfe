import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AuthGuardComponent } from './guards/AuthGuard/auth-guard/auth-guard.component';
import { CanDeactivateGuardComponent } from './guards/CanDeactivateGuard/can-deactivate-guard/can-deactivate-guard.component';
import { HeaderComponent } from './header/header.component';
import { SecurityComponent } from './shared/Common/security/security.component';
import { ServerDownComponent } from './shared/Common/server-down/server-down.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { CandidateDetailsComponent } from './candidate/candidate-details/candidate-details.component';
import { SoDetailsComponent } from './so/so-details/so-details.component';
import { SoListComponent } from './so/so-list/so-list.component';

import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { CandidateListComponent } from './candidate/candidate-list/candidate-list.component';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatTableModule } from '@angular/material/table';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatSortModule } from '@angular/material/sort'
import { HttpClientModule } from '@angular/common/http';

import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatCardModule } from "@angular/material/card";
import { MatProgressBarModule } from "@angular/material/progress-bar";
import { MatMenuModule } from "@angular/material/menu";
import { MatExpansionModule } from '@angular/material/expansion';
import { MatButtonModule } from '@angular/material/button';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatIconModule } from "@angular/material/icon";
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatListModule } from '@angular/material/list';
import { MatGridListModule } from '@angular/material/grid-list';
import { MatTreeModule } from '@angular/material/tree';
import { MatSelectModule } from '@angular/material/select';
import { MatRadioModule } from '@angular/material/radio';
import { ReactiveFormsModule } from '@angular/forms';
import {MatDatepickerModule} from '@angular/material/datepicker';
import {MatTooltipModule} from '@angular/material/tooltip';
import { MatNativeDateModule } from '@angular/material/core';
@NgModule({
  declarations: [
    AppComponent,
    AuthGuardComponent,
    CanDeactivateGuardComponent,
    HeaderComponent,
    SecurityComponent,
    ServerDownComponent,
    CandidateDetailsComponent,
    CandidateListComponent,
    SoDetailsComponent,
    SoListComponent
  ],
  imports: [
    BrowserModule, AppRoutingModule, BrowserAnimationsModule, MatFormFieldModule, MatSortModule,
    MatPaginatorModule, MatTableModule, MatSlideToggleModule, MatInputModule,HttpClientModule,MatButtonModule,
    ReactiveFormsModule,MatRadioModule,MatSelectModule,MatTreeModule,MatGridListModule,
    MatListModule,MatListModule,MatSidenavModule,MatIconModule,MatIconModule,MatCardModule,
    MatToolbarModule,MatExpansionModule,MatMenuModule,MatCheckboxModule,
    MatProgressBarModule,MatDatepickerModule,MatTooltipModule,MatNativeDateModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule { }
