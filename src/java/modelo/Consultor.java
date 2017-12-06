/*
 *      Author ::: Brian Sterling
 *     Program ::: Bases de Datos
 *  Credential ::: SIST0008-G01:SIV
 */
package modelo;

public class Consultor
{
    private int idConsultor;
    private String labor;

    public int getIdConsultor() {
        return idConsultor;
    }

    public void setIdConsultor(int idConsultor) {
        this.idConsultor = idConsultor;
    }

    public String getLabor() {
        return labor;
    }

    public void setLabor(String labor) {
        this.labor = labor;
    }

    @Override
    public String toString() {
        return "Consultor{" + "idConsultor=" + idConsultor + ", labor=" + labor + '}';
    }
}