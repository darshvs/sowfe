import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DatePipe } from '@angular/common';

import { AppComponent } from './app.component';
import { AuthGuardComponent } from './guards/AuthGuard/auth-guard/auth-guard.component';
import { CanDeactivateGuardComponent } from './guards/CanDeactivateGuard/can-deactivate-guard/can-deactivate-guard.component';

import { HeaderComponent } from './header/header.component';
import { SecurityComponent } from './shared/Common/security/security.component';
import { ServerDownComponent } from './shared/Common/server-down/server-down.component';
import { CandidateDetailsComponent } from './candidate/candidate-details/candidate-details.component';
import { SoDetailsComponent } from './so/so-details/so-details.component';
import { SoListComponent } from './so/so-list/so-list.component';
import { CandidateListComponent } from './candidate/candidate-list/candidate-list.component';
import { DomainComponent } from './domain/domain.component';
import { CandidateMappingComponent } from './candidate-mapping/candidate-mapping.component';

import { StatusService } from './shared/Services/StatusService/status.service';
import { CandidateService } from './shared/Services/CandidateService/candidate.service';
import { ExcelService } from './shared/Services/ExcelService/excel.service';

import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatTableModule } from '@angular/material/table';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatSortModule } from '@angular/material/sort'
import { MatDialogModule } from '@angular/material/dialog';
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
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatTooltipModule } from '@angular/material/tooltip';
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
    SoListComponent,
    DomainComponent,
    CandidateMappingComponent,
  ],
  imports: [
    BrowserModule, AppRoutingModule, BrowserAnimationsModule, HttpClientModule,
    ReactiveFormsModule, FormsModule,
    MatFormFieldModule, MatSortModule, MatButtonModule, MatNativeDateModule,
    MatPaginatorModule, MatTableModule, MatSlideToggleModule, MatInputModule,
    MatRadioModule, MatSelectModule, MatTreeModule, MatGridListModule, MatDialogModule,
    MatListModule, MatListModule, MatSidenavModule, MatIconModule, MatIconModule, MatCardModule,
    MatToolbarModule, MatExpansionModule, MatMenuModule, MatCheckboxModule,
    MatProgressBarModule, MatDatepickerModule, MatTooltipModule,
  ],
  providers: [StatusService, CandidateService, ExcelService],
  bootstrap: [AppComponent],
})
export class AppModule { }
