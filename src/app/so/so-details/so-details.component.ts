import { Component, ViewChild } from '@angular/core';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { MatSort, MatSortModule } from '@angular/material/sort';
import * as XLSX from "xlsx";
import { SoService } from 'src/app/shared/Services/SoService/so.service';

@Component({
  selector: 'app-so-details',
  templateUrl: './so-details.component.html',
  styleUrls: ['./so-details.component.css']
})
export class SoDetailsComponent {
  file: File;
  arrayBuffer: any;
  filelist: any;

  displayedColumns: string[] = [
    // 'accountName',
    'soName','jrCode','requestCreationDate','technologyName','role','region','location','targetOpenPositions',
    'positionsTobeClosed','ustpocName','recruiterName','usttpmName','dellManagerName','statusName',
    'band','projectId','accountManager','externalResource','internalResource','actions'    
  ];
  dataSource!: MatTableDataSource<any>;

  @ViewChild(MatPaginator) paginator: MatPaginator
  @ViewChild(MatSort) sort: MatSort;

  constructor(
    private _soService: SoService,
    // private mappingService: CandidatemappingService,
    // private excelService: ExcelService,
    // public formBuilder: FormBuilder,
    // private login: LoginService,
    // private router: Router
  ) { }
  ngOnInit(): void {
    // this.isAuthor = JSON.parse(sessionStorage.getItem("author"));
    this.GetSowData();
  }
  
  GetSowData() {
    this._soService.GetAllSowData().subscribe(
      (data) => {
        console.log(data)
        this.dataSource = new MatTableDataSource(data);
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
      },
      (err) => {
        console.log(err);
      }
    );
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

  onFileSelected(event: any) {
   
  }
  DownloadExcel() {

  }
  deleteDetails(so: any) {
    // this._soService.DeleteSowData(so.so).subscribe((res) => {
    //   alert(res);
    //   // this.GetCandidateData();
    // });
  }
}

