import { Component, inject } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { CandidateService } from 'src/app/shared/Services/CandidateService/candidate.service';

@Component({
  selector: 'app-candidate-list',
  templateUrl: './candidate-list.component.html',
  styleUrls: ['./candidate-list.component.css']
})
export class CandidateListComponent {

  constructor(private service: CandidateService,
    // private router: ActivatedRoute,
    // private commonServ: CommonService,
    // private route: Router,
    // private statusService: StatusserviceService
    ) { }
  private fb = inject(FormBuilder);
  addressForm = this.fb.group({
    company: null,
    firstName: [null, Validators.required],
    lastName: [null, Validators.required],
    address: [null, Validators.required],
    address2: null,
    city: [null, Validators.required],
    state: [null, Validators.required],
    postalCode: [null, Validators.compose([
      Validators.required, Validators.minLength(5), Validators.maxLength(5)])
    ],
    shipping: ['free', Validators.required]
  });
  hasUnitNumber = false;

  candidateform = new FormGroup({
    candidateName: new FormControl('', [Validators.required]),
    dob: new FormControl('', [Validators.required]),
    mobileNo: new FormControl('', [Validators.required, Validators.pattern("^[0-9]*$"),
    Validators.minLength(10), Validators.maxLength(10)]),
    email: new FormControl('', [Validators.required, Validators.email]),
    gender: new FormControl('', [Validators.required]),
    status: new FormControl('', [Validators.required]),
    joiningDate: new FormControl('', Validators.required),
    skills: new FormControl('', [Validators.required]),
    location: new FormControl('', [Validators.required]),
    address: new FormControl('', [Validators.required]),
    pincode: new FormControl('', [Validators.required, Validators.minLength(6), Validators.maxLength(6), Validators.pattern("^[0-9]*$")]),
    isInternal: new FormControl(),
  })
  states = [
    { name: 'Alabama', abbreviation: 'AL' },
    { name: 'Alaska', abbreviation: 'AK' },
  ];


  onSubmit(): void {
    alert('Thanks!');
  }
}
