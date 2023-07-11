
import { Component, ElementRef, TemplateRef, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { CandidateMappingService } from '../shared/Services/CandidateMappingService/candidate-mapping.service';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
// import { CandidateModel } from '../Models/CandidateModel';
import { MatFormFieldModule } from '@angular/material/form-field';
// import { SOModel } from '../Models/SOModel';
// import { StatusModel } from '../Models/StatusModel';
import { CandidateService } from '../shared/Services/CandidateService/candidate.service';
import { SoService } from '../shared/Services/SoService/so.service';
import { StatusService } from '../shared/Services/StatusService/status.service';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ExcelService } from '../shared/Services/ExcelService/excel.service';

@Component({
  selector: 'app-candidate-mapping',
  templateUrl: './candidate-mapping.component.html',
  styleUrls: ['./candidate-mapping.component.css']
})
export class CandidateMappingComponent {
  SOData: any[] = [];
  CandidateData: any[] = [];
  StatusData: any[] = [];
  MappingsList: any = [];
  MappingData: any = [];
  downloadObject: any;
  CandidateMappingData: any = [];
  Id: any = null;
  isEditing: boolean = false;
  submitted: boolean = false;
  displayedColumns: string[] = ['soName', 'candidateName',
    'status', 'actions'];
  dataSource!: MatTableDataSource<any>;
  selectedStatus:any='';

  @ViewChild(MatPaginator) paginator: MatPaginator
  @ViewChild(MatSort) sort: MatSort;
  @ViewChild('modalContent') modalContent!: TemplateRef<any>;

  @ViewChild('soNameVar') soNameFilterVar: any = '';
  @ViewChild('candidateNameVar') candidateNameFilterVar: any = '';
  // @ViewChild('statusvar') statusFilterVar:any='';
  tempMappingArray: never[];

  constructor(
    private service: CandidateMappingService,
    public dialog: MatDialog, private candidateservice: CandidateService,
    private sowService: SoService,
    private statusService: StatusService,
    private excelService: ExcelService,

    // public formBuilder: FormBuilder,
    // private login: LoginService,
    // private router: Router
  ) { }
  async ngOnInit() {
    await this.GetSOData();
    await this.GetCandidateData();
    await this.GetStatusData();
    // this.isAuthor = JSON.parse(sessionStorage.getItem('author'));
    // console.log(this.isAuthor)
    this.GetCandidateMappingData();
  }
  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }


  applyEdit(candidate: any) {
    
    candidate.isEditing = true;
  }

  cancelEdit(candidate: any) {
    candidate.isEditing = false;
  }
  UpdateCandidate(candidate: any) {
    
    this.service.UpdateCandidateMappingData(candidate.soW_CandidateId, candidate).subscribe(res => {
      candidate.isEditing = false;
      alert(res);
      this.GetCandidateMappingData();
    }, err => {
      console.log(err)
    })
  }


  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

  GetCandidateMappingData() {
    this.service.GetAllCandidateMappingData().subscribe(
      (data) => {
        console.log(data);
        this.dataSource = new MatTableDataSource(data);
        this.CandidateMappingData = data;
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
      },
      (err) => {
        console.log(err);
      }
    );
  }

  openModal(): void {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.width = '1000px';
    const dialogRef = this.dialog.open(this.modalContent);

    dialogRef.afterClosed().subscribe(result => {
      console.log(`Dialog result: ${result}`);
    });
  }


  closeModal(): void {
    this.dialog.closeAll();
  }

  mapppingForm = new FormGroup({
    candidateId: new FormControl('', [Validators.required]),
    sowId: new FormControl('', [Validators.required]),
    statusId: new FormControl('', [Validators.required])
  })

  get f() { return this.mapppingForm.controls; }

  onSubmit() {
    this.submitted = true;
    if (this.mapppingForm.invalid) {
      this.markAllFieldsAsTouched();
      console.log('invalid');
      return;
    }
    else {
      this.onAdd();

    }
  }


  isFieldInvalid(fieldName: string): boolean {
    const control = this.mapppingForm.get(fieldName);
    // return control.invalid && (control.touched || this.submitted);
    return control !== null && control.invalid && (control.touched || this.submitted);
  }

  markAllFieldsAsTouched() {
    Object.keys(this.mapppingForm.controls).forEach(fieldName => {
      // this.mapppingForm.controls[fieldName].markAsTouched();
      this.mapppingForm.controls[fieldName as keyof typeof this.mapppingForm.controls].markAsTouched();

    });
  }

  onAdd() {
    let formValue = this.mapppingForm.value;
    let obj = {
      sowId: formValue.sowId,
      candidateId: formValue.candidateId,
      StatusId: formValue.statusId,
      type: "post",
    };
    this.service.PostCandidateMappingData(obj).subscribe(data => {
      alert(data);
      this.mapppingForm.reset();
      this.GetCandidateMappingData();
    })
  }

  deleteDetails(map: any) {
    this.Id = map.soW_CandidateId;
    var decision = confirm('Are you sure you want to delete?');
    if (decision) {
      this.service.DeleteCandidateMappingData(map.soW_CandidateId).subscribe(res => {
        alert(res);
        this.GetCandidateMappingData();
        this.Id = null;
      })
    }
    else {
      alert('Data not Deleted');
    }
  }

  getSOName(id: any) {
    if (this.SOData != null && id != "") {
      var obj: any;
      this.SOData.find((x: any) => {
        if (x.sowId == id) {
          obj = x;
        }
      })
      return obj.soName;
    }
  }

  getCandidateName(id: any) {
    if (this.CandidateData != null && id != "") {
      var obj: any;
      this.CandidateData.find((x: any) => {
        if (x.candidateId == id) {
          obj = x;
        }
      })
      console.log(this.CandidateData)
      return obj.candidateName;
    }
  }

  GetSOData() {
    return new Promise((res, rej) => {
      this.sowService.GetAllSowData().subscribe(data => {
        this.SOData = data;
        res('')
      })
    })
  }


  GetCandidateData() {
    return new Promise((res, rej) => {
      this.candidateservice.GetAllCandidatesData().subscribe(data => {
        this.CandidateData = data;
        res('')
      })
    })
  }

  GetStatusData() {
    return new Promise((res, rej) => {
      this.statusService.GetAllStatusData().subscribe(data => {
        this.StatusData = data;
        res('')
      })
    })
  }

  getStatus(id: any) {
    if (this.StatusData != null && id != "") {
      var obj: any;
      this.StatusData.find((x: any) => {
        if (x.statusId == id) {
          obj = x;
        }
      })
      return obj.statusName;
    }
  }

  GetSOCandidateDetails() {
    if (this.MappingsList != undefined || this.MappingsList != null) {
      this.MappingData = [];
      this.MappingsList.forEach((element: any) => {
        let obj = {
          soW_CandidateId: element.soW_CandidateId,
          sowName: this.getSOName(element.sowId),
          candidateName: this.getCandidateName(element.candidateId),
          status: this.getStatus(element.statusId)
        }
        this.MappingData.push(obj);
      })
    }
  }
  DownloadExcel() {
    this.GetCandidateMappingData()
    this.downloadObject = this.createObject(this.CandidateMappingData)
    let headers = [['SO Name', 'Candidate Name', 'Status']]
    this.excelService.jsonExportAsExcel(this.downloadObject, "SOCandidate Mapping", headers);
  }

  createObject(data: any) {
    return {
      'SOCandidate Mapping Data': data,
    }
  }


  customFilter() {
    let filterObject: any = {
      soName: this.soNameFilterVar.nativeElement.value,
      candidateName: this.candidateNameFilterVar.nativeElement.value,
      statusName:this.selectedStatus
      
    }
    console.log(filterObject)

    let tempMappingArray = this.CandidateMappingData.filter((element:any) => 
    (filterObject.soName===''||element.soName.toLowerCase().startsWith(filterObject.soName.toLowerCase()))&&
    (filterObject.candidateName===''||element.candidateName.toLowerCase().startsWith(filterObject.candidateName.toLowerCase()))&&
    (filterObject.statusName===''||element.statusName.toLowerCase().startsWith(filterObject.statusName.toLowerCase()))
    );
    
    console.log(tempMappingArray);
    
    this.dataSource = new MatTableDataSource(tempMappingArray);
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;    
  }
}