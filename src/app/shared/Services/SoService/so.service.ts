import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class SoService {
  apiUrl = environment.apiUrl;
  baseUrl: string = this.apiUrl + "/Sow";
  private header = new HttpHeaders({ 'content-type': 'application/json' });
  constructor(private http: HttpClient) { }
  GetAllSowData(): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}`);
  }
  PostSOWDuplicateCheck(data: any): Observable<any> {
    let DATA = { 'SOW': data }
    console.log(DATA)
    return this.http.post<any>(`${this.baseUrl}/Sowimportdata`, DATA, { headers: this.header })
  }
  PostSowData(data: any): Observable<any> {
    return this.http.post<any>(`${this.baseUrl}`, data);
  }
  DeleteSowData(id: any): Observable<any> {
    return this.http.delete<any>(`${this.baseUrl}/${id}`);
  }
  UpdateSowData(id: any, data: any): Observable<any> {
    return this.http.put<any>(`${this.baseUrl}/${id}`, data)
  }
  GetSowById(id: any): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}/${id}`)
  }
  GetSOByDate(startDate: any, endDate: any): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}/GetDate?StartDate=${startDate}&EndDate=${endDate}`)
  }
}
