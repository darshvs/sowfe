import { Component, ViewChild, TemplateRef, Inject, LOCALE_ID } from '@angular/core';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { CandidateService } from 'src/app/shared/Services/CandidateService/candidate.service';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { MatSort, MatSortModule } from '@angular/material/sort';
import * as XLSX from "xlsx";
import { Router } from '@angular/router';
import { FormControl, FormGroup } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { formatDate } from '@angular/common';
import { StatusService } from 'src/app/shared/Services/StatusService/status.service';
import { ExcelService } from 'src/app/shared/Services/ExcelService/excel.service';

@Component({
  selector: 'app-candidate-details',
  templateUrl: './candidate-details.component.html',
  styleUrls: ['./candidate-details.component.css']
})

export class CandidateDetailsComponent {
  @ViewChild(MatPaginator) paginator: MatPaginator
  @ViewChild(MatSort) sort: MatSort;

  displayedColumns: string[] = ['candidateUid', 'candidateName', 'dob', 'mobileNo', 'email',
    'gender', 'skills', 'joiningDate', 'location', 'address',
    'pincode', 'status', 'isInternal', 'actions'];
  dataSource!: MatTableDataSource<any>;

  file: File;
  arrayBuffer: any;
  filelist: any;
  isEditing: boolean = false;
  isAuthor: any;
  candidatesList: any;
  statusList: any;
  filteredCandidates: any[] | undefined;
  downloadData: any = [];
  isInternal: string;
  downloadObject: any;


  constructor(
    private _candidateService: CandidateService,
    private dialog: MatDialog,
    @Inject(LOCALE_ID) public locale: string,
    // private mappingService: CandidatemappingService,
    private _excelService: ExcelService,
    public _statusService: StatusService,
    // private login: LoginService,
    private _router: Router
  ) { }
  ngOnInit(): void {
    this.isAuthor = JSON.parse(sessionStorage.getItem("author") as string);
    this.GetCandidateData();
    this.filteredCandidates = this.candidatesList
    this.GetStatusByType();

  }
  GetCandidateData() {
    this._candidateService.GetAllCandidatesData().subscribe(
      (data) => {
        // console.log(data)

        this.candidatesList = data;
        this.dataSource = new MatTableDataSource(data);
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
        // console.log(this.dataSource.filteredData)

      },
      (err) => {
        console.log(err);
      }
    );
  }

  GetStatusByType() {
    this._statusService.GetStatusByType('Candidate').subscribe(result => {
      this.statusList = result;
    })
  }
  // FIlter
  filterForm = new FormGroup({
    candidateUid: new FormControl(''),
    candidateName: new FormControl(''),
    dobFrom: new FormControl(''),
    dobTo: new FormControl(''),
    gender: new FormControl(''),
    status: new FormControl(''),
    joiningDateFrom: new FormControl(''),
    joiningDateTo: new FormControl(''),
    skills: new FormControl(''),
    location: new FormControl(''),
    isInternal: new FormControl(''),
    address: new FormControl(''),
    pincode: new FormControl(''),
    mobileNo: new FormControl(''),
    email: new FormControl(''),
  })

  // applyFilter(event: Event) {
  //   const filterValue = (event.target as HTMLInputElement).value;
  //   this.dataSource.filter = filterValue.trim().toLowerCase();

  //   if (this.dataSource.paginator) {
  //     this.dataSource.paginator.firstPage();
  //   }
  // }

  restCustomFilter() {
    this.filterForm.reset()
    this.filteredCandidates = this.candidatesList
    this.customFilter();
    this.dataSource = new MatTableDataSource(this.candidatesList);
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
  }

  customFilter(): void {
    let uidFilter = this.filterForm.value.candidateUid;
    let candidateNameFilter = this.filterForm.value.candidateName;
    let genderFilter = this.filterForm.value.gender;
    let statusFilter = this.filterForm.value.status;
    let skillsFilter = this.filterForm.value.skills;
    let locationFilter = this.filterForm.value.location;
    let isInternalFilter = this.filterForm.value.isInternal;
    let dobFromFilter = this.filterForm.value.dobFrom as string;
    let dobToFilter = this.filterForm.value.dobTo as string;
    let joiningDateFromFilter = this.filterForm.value.joiningDateFrom as string;
    let joiningDateToFilter = this.filterForm.value.joiningDateTo as string;
    if (dobFromFilter) {
      dobFromFilter = this.formatdate(dobFromFilter);
    }
    if (dobToFilter) {
      dobToFilter = this.formatdate(dobToFilter)
    }
    if (joiningDateFromFilter) {
      joiningDateFromFilter = this.formatdate(joiningDateFromFilter);
    }
    if (joiningDateToFilter) {
      joiningDateToFilter = this.formatdate(joiningDateToFilter)
    }
    this.filteredCandidates = this.candidatesList.filter((candidate: any) =>
      (uidFilter === '' || candidate.candidateUid.startsWith(uidFilter)) &&
      (candidateNameFilter === '' || candidate.candidateName.toLowerCase().startsWith(candidateNameFilter?.toLowerCase())) &&
      (skillsFilter === '' || candidate.skills.toLowerCase().includes(skillsFilter?.toLowerCase())) &&
      (locationFilter === '' || candidate.location.toLowerCase().startsWith(locationFilter?.toLowerCase())) &&

      (genderFilter === '' || candidate.gender.toLowerCase().startsWith(genderFilter?.toLowerCase())) &&
      (statusFilter === '' || candidate.status.toLowerCase().startsWith(statusFilter?.toLowerCase())) &&
      (isInternalFilter === '' || isInternalFilter === 'true' ? candidate.isInternal : !candidate.isInternal) &&

      (dobFromFilter === '' && dobToFilter === '' || candidate.dob >= dobFromFilter && candidate.dob <= dobToFilter) &&
      (joiningDateFromFilter === '' && joiningDateToFilter === '' || candidate.joiningDate >= joiningDateFromFilter && candidate.joiningDate <= joiningDateToFilter)
    )
    this.dataSource = new MatTableDataSource(this.filteredCandidates);
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
  }

  // UPDATE
  selectRow(item: any) {
    this.dataSource.filteredData.forEach((element: any) => {
      element.isEditing = false
    });
    item.isEditing = true;
  }

  cancelUpdate(item: any) {
    item.isEditing = false;
  }

  UpdateDomainName(item: any) {
    if (item) {
      item.isEditing = false;
      delete item.isEditing;
      item.dob = (this.formatdate(item.dob) + "T00:00:00.00Z")
      item.joiningDate = (this.formatdate(item.joiningDate) + "T00:00:00.00Z");
      // console.log(item)
    }
    this._candidateService.UpdateCandidateData(item.candidateId, item).subscribe(
      (data) => {
        alert(data);
      },
      (err) => {
        console.log(err);
      }
    )
  }

  DownloadExcel() {
    console.table(this.filteredCandidates)

    if (this.filteredCandidates != null || this.filteredCandidates != undefined) {
      for (var i in this.filteredCandidates) {
        const keyValuePairs: { [key: string]: string } = {
          candidateUid: this.filteredCandidates[i].candidateUid,
          candidateName: this.filteredCandidates[i].candidateName,
          mobileNo: this.filteredCandidates[i].mobileNo,
          gender: this.filteredCandidates[i].gender,
          dob: this.filteredCandidates[i].dob,
          email: this.filteredCandidates[i].email,
          location: this.filteredCandidates[i].location,
          skills: this.filteredCandidates[i].skills,
          joiningDate: this.filteredCandidates[i].joiningDate,
          address: this.filteredCandidates[i].address,
          status: this.filteredCandidates[i].status,
          pincode: this.filteredCandidates[i].pincode,
          isInternal: this.filteredCandidates[i].isInternal ? this.isInternal = "Yes" : this.isInternal = "No"
        };
        this.downloadData.push(keyValuePairs);
      }
      this.downloadObject = this.createObject(this.downloadData);
      // console.log(this.downloadObject);

      let headers = [
        [
          "Candidate UID",
          "Candidate Name",
          "Mobile No",
          "Gender",
          "DOB",
          "Email",
          "Location",
          "Skills",
          "Joining Date",
          "Address",
          "Status",
          "Pincode",
          "isInternal",
        ],
      ];
      this._excelService.jsonExportAsExcel(this.downloadObject, "Candidate Details", headers);

    } else alert("No Records found!");



  }
  createObject(data: any) {
    return {
      "Candidate Data": data,
    };

  }

  onFileSelected(event: any) {
    this.file = event.target.files[0];
    let fileReader = new FileReader();
    fileReader.readAsArrayBuffer(this.file);
    fileReader.onload = (e) => {
      this.arrayBuffer = fileReader.result;
      var data = new Uint8Array(this.arrayBuffer);
      var arr = new Array();
      for (var i = 0; i != data.length; ++i)
        arr[i] = String.fromCharCode(data[i]);
      var bstr = arr.join("");
      var workbook = XLSX.read(bstr, { type: "binary" });
      var first_sheet_name = workbook.SheetNames[0];
      var worksheet = workbook.Sheets[first_sheet_name];
      this.filelist = XLSX.utils.sheet_to_json(worksheet, { raw: true });
      // console.log(this.filelist)

      this.filelist.forEach((element: any) => {
        element.CandidateUid = JSON.stringify(element.CandidateUid)
      });

      this._candidateService.PostCandidateDuplicateCheck(this.filelist).subscribe((x) => {
        alert(x);
        this._candidateService.GetAllCandidatesData().subscribe(
          (data) => {
            this.dataSource = new MatTableDataSource(data);
            this.dataSource.sort = this.sort;
            this.dataSource.paginator = this.paginator;
          },
          (err) => {
            console.log(err);
          }
        );
      });
    };
  }

  deleteDetails(candidate: any) {
    if (confirm("Do you want to delete record of " + candidate.candidateName)) {
      this._candidateService.DeleteCandidateData(candidate.candidateId).subscribe((res) => {
        alert(res);
        this.GetCandidateData();
      });
    }

  }

  formatdate(date: any) {
    return formatDate(date, 'yyyy-dd-MM', this.locale);
  }

}