import { Component, TemplateRef, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatDialog } from '@angular/material/dialog';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { DomainService } from '../shared/Services/DomainService/domain.service';
import { ExcelService } from '../shared/Services/ExcelService/excel.service';
import { MatFormFieldModule } from '@angular/material/form-field';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-domain',
  templateUrl: './domain.component.html',
  styleUrls: ['./domain.component.css']
})
export class DomainComponent {
  downloadObject: any;
  DomainList: any = [];
  submitted: boolean = false;
  DomainData: any = [];
  Id: any = null;
  isEditing: boolean = false;
  displayedColumns: string[] = ['domainName', 'action'];
  dataSource!: MatTableDataSource<any>;

  @ViewChild(MatPaginator) paginator: MatPaginator
  @ViewChild(MatSort) sort: MatSort;
  @ViewChild('modalContent') modalContent!: TemplateRef<any>;

  ngOnInit(): void {

    this.GetDomainData();
    this.GetDomainDetails();
    

  }
  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }
  constructor(
    private service: DomainService,
    private excelService: ExcelService,
    public dialog: MatDialog,
  ) { }

  
  applyEdit(domain: any) {
   
    domain.isEditing = true;
  }
  cancelEdit(domain: any) {
    domain.isEditing = false;
  }
  UpdateDomain(domain: any) {
    
    console.log(domain)
    this.service.UpdateDomainData(domain.domainId, domain).subscribe(res => {
      alert(res);
      this.domainForm.reset();
      domain.isEditing = false;
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
  get f() { return this.domainForm.controls; }

  domainForm = new FormGroup({
    domainName: new FormControl('', [Validators.required, Validators.pattern(/^[A-Za-z,&.+# ]+$/)])
  })


  GetDomainData() {
    this.service.GetAllDomainData().subscribe(
      (data) => {
        this.DomainList = data;
        this.dataSource = new MatTableDataSource(data);
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
      },
      (err) => {
        console.log(err);
      }
    );
  }
  onSubmit() {
    this.submitted = true;

    if (this.domainForm.invalid) {
      // this.markAllFieldsAsTouched();
      return;
    }
    else {
      this.onAdd();

    }
  }

  isFieldInvalid(fieldName: string): boolean {
    const control = this.domainForm.get(fieldName);
    return (control?.invalid ?? false) && (control?.touched || this.submitted);
  }

  markAllFieldsAsTouched() {
    Object.keys(this.domainForm.controls).forEach(fieldName => {
      this.domainForm.controls[fieldName as keyof typeof this.domainForm.controls].markAsTouched();
    });
  }

  onAdd() {
    let formValue = this.domainForm.value;

    let obj = {
      domainName: formValue.domainName,
      type: "post",
    };
    this.service.PostDomainData(obj).subscribe(data => {
      alert(data);
      this.domainForm.reset();
      this.GetDomainData();
    })
  }

  deleteDetails(domain: any) {
    this.Id = domain.domainId;
    var decision = confirm('Are you sure you want to delete?');
    if (decision) {
      this.service.DeleteDomainData(domain.domainId).subscribe(res => {
        alert(res);
        this.GetDomainData();
        this.Id = null;
      })
    }
    else {
      alert('Domain - ' + domain.domainName + ' Not Deleted')
    }
  }


  GetDomainDetails() {
    this.DomainList.forEach((element: any) => {
      let obj = {
        domainId: element.domainId,
        domainName: element.domainName,
      }
      this.DomainData.push(obj);
    })
  }


  openModal(): void {
    const dialogRef = this.dialog.open(this.modalContent);

    dialogRef.afterClosed().subscribe(result => {
      console.log(`Dialog result: ${result}`);
    });
  }

  closeModal(): void {
    this.dialog.closeAll();
  }

  DownloadExcel() {
    this.GetDomainDetails();
    console.log(this.DomainData)
    this.downloadObject = this.createObject(this.DomainData)

    console.log(this.downloadObject);
    let headers = [['Domain Id', 'Domain Name']]
    this.excelService.jsonExportAsExcel(this.downloadObject, "Domain Details", headers);
  }
  createObject(data: any) {
    return {
      'Domain Data': data,
    }
  }


}