import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Medico } from '../../models/medico/medico';
import { UsuariosService } from '../usuarios/usuarios.service';
import { environment } from '../../../../environment.prod';

@Injectable({
  providedIn: 'root'
})
export class MedicoService {
  private apiUrl = `${environment.apiUrl}/medico`;

  constructor(private http: HttpClient, private usuariosService: UsuariosService) {}

  getAll(): Observable<Medico[]> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    return this.http.get<Medico[]>(`${this.apiUrl}?idEmpresa=${idEmpresa}`);
  }

  getById(id: number): Observable<Medico> {
    return this.http.get<Medico>(`${this.apiUrl}/${id}`);
  }

  create(medico: Medico): Observable<Medico> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const medicoData = { ...medico, idEmpresa };
    return this.http.post<Medico>(this.apiUrl, medicoData);
  }

  update(id: number, medico: Medico): Observable<Medico> {
    return this.http.put<Medico>(`${this.apiUrl}/${id}`, medico);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
