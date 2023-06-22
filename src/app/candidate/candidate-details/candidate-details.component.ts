import { Component, ViewChild } from '@angular/core';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { CandidateService } from 'src/app/shared/Services/CandidateService/candidate.service';
import {MatPaginator, MatPaginatorModule} from '@angular/material/paginator';
import {MatSort, MatSortModule} from '@angular/material/sort';


@Component({
  selector: 'app-candidate-details',
  templateUrl: './candidate-details.component.html',
  styleUrls: ['./candidate-details.component.css']
})

export class CandidateDetailsComponent {
  // CandidateList: any;
  // rowCount: any;

  displayedColumns: string[] = ['candidateName', 'dob', 'mobileNo', 'email',
    'gender', 'skills', 'joiningDate', 'location', 'address',
    'pincode', 'status', 'isInternal', 'actions'];
  dataSource!: MatTableDataSource<any>;

  @ViewChild(MatPaginator) paginator: MatPaginator
  @ViewChild(MatSort) sort: MatSort;

  constructor(
    private service: CandidateService,
    // private mappingService: CandidatemappingService,
    // private excelService: ExcelService,
    // public formBuilder: FormBuilder,
    // private login: LoginService,
    // private router: Router
  ) { }
  ngOnInit(): void {
    // this.isAuthor = JSON.parse(sessionStorage.getItem("author"));
    this.GetCandidateData();
  }
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }
  
  GetCandidateData() {
    this.service.GetAllCandidatesData().subscribe(
      (data) => {
        this.dataSource = new MatTableDataSource(data);
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
      },
      (err) => {
        console.log(err);
      }
    );
  }

  DownloadExcel(){
    
  }
  onFileSelected(){

  }
}




