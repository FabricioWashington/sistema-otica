import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EmpresaService {
  private apiUrl = 'http://localhost:8080/api/empresa';

  constructor(private http: HttpClient) { }

  cadastrarEmpresa(empresa: any): Observable<any> {
    return this.http.post(`${this.apiUrl}`, empresa);
  }

  listarEmpresas(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}`);
  }

  buscarEmpresa(idOuCnpj: string): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/${idOuCnpj}`);
  }

  atualizarEmpresa(id: number, empresa: any): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}`, empresa);
  }

  excluirEmpresa(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${id}`);
  }
}
