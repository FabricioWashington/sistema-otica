import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { CargoFuncionario } from '../../models/cargo-funcionario/cargo-funcionario';

@Injectable({
  providedIn: 'root'
})
export class CargoFuncionarioService {
  private apiUrl = 'http://localhost:8080/api/cargofuncionario';

  constructor(private http: HttpClient) {}

  getAll(): Observable<CargoFuncionario[]> {
    return this.http.get<CargoFuncionario[]>(this.apiUrl);
  }

  getById(id: number): Observable<CargoFuncionario> {
    return this.http.get<CargoFuncionario>(`${this.apiUrl}/${id}`);
  }

  create(cargo: CargoFuncionario): Observable<CargoFuncionario> {
    return this.http.post<CargoFuncionario>(this.apiUrl, cargo);
  }

  update(id: number, cargo: CargoFuncionario): Observable<CargoFuncionario> {
    return this.http.put<CargoFuncionario>(`${this.apiUrl}/${id}`, cargo);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}

